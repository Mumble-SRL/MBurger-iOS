//
//  MBPushApiManager.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPushApiManager.h"

#import <AFNetworking/AFHTTPSessionManager.h>

@implementation MBPushApiManager

typedef void (^AFHTTPRequestOperationSuccessHandler) (NSURLSessionTask *operation, id responseObject);
typedef void (^AFHTTPRequestOperationFailureHandler) (NSURLSessionTask *operation, NSError *error);

+ (void) callApiWithPushToken: (NSString  *) pushToken
                      ApiName: (NSString *) apiName
                   HTTPMethod: (MBHTTPMethod) httpMethod
                   Parameters: (NSDictionary *) parameters
             HeaderParameters: (NSDictionary *) headerParameters
                      Success: (void (^)(MBResponse *response)) success
                      Failure: (void (^)(NSError *error)) failure {
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", [self baseUrl], apiName];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (httpMethod == MBHTTPMethodPost || httpMethod == MBHTTPMethodPut){
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    NSMutableDictionary *totalParametersDictionary = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    totalParametersDictionary[@"device_id"] = [self deviceIdString];
    
    for (NSString *key in headerParameters.allKeys){
        [manager.requestSerializer setValue:headerParameters[key] forHTTPHeaderField:key];
    }
    
    [manager.requestSerializer setValue:pushToken forHTTPHeaderField:@"X-MPush-Token"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"X-MPush-Version"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    AFHTTPRequestOperationSuccessHandler successHandler = ^(NSURLSessionTask *operation, id responseObject){
        if (responseObject && responseObject != [NSNull null] && [responseObject isKindOfClass:[NSDictionary class]]){
            NSDictionary *responseDictionary = (NSDictionary *) responseObject;
            NSInteger statusCode = [responseDictionary[@"status_code"] integerValue];
            if (statusCode == 0){
                MBResponse *response = [[MBResponse alloc] init];
                if (responseDictionary[@"body"]){
                    if ([responseDictionary[@"body"] isKindOfClass:[NSDictionary class]]){
                        response.payload = responseDictionary[@"body"];
                    }
                    else if ([responseDictionary[@"body"] isKindOfClass:[NSArray class]]){
                        response.payload = @{@"data": responseDictionary[@"body"]};
                    }
                }
                response.dataTask = operation;
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success){
                        success(response);
                    }
                });
            } else {
                NSString *message = responseDictionary[@"message"] ? responseDictionary[@"message"] : @"";
                NSError *error = [[NSError alloc] initWithDomain: @"com.mumble.mburger.push" code: statusCode userInfo:@{NSLocalizedDescriptionKey: message, NSDebugDescriptionErrorKey: message}];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (failure){
                        failure(error);
                    }
                });
            }
        }
        else {
            NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.mburger.push" code:100 userInfo:@{NSLocalizedDescriptionKey : @"Can't find response"}];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (failure){
                    failure(error);
                }
            });
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    };
    
    AFHTTPRequestOperationFailureHandler failureHandler = ^(NSURLSessionTask *operation, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey]){
                NSString *responseString = [[NSString alloc] initWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                NSString *message = [self messageErrorForResponseString:responseString];
                if (message != nil){
                    if (failure){
                        NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.mburger.psuh" code:102 userInfo:@{NSLocalizedDescriptionKey : message}];
                        failure(error);
                    }
                    return;
                }
            }
            if (failure){
                failure(error);
            }
        });
    };
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    switch (httpMethod) {
        case MBHTTPMethodGet:
            [manager GET:urlString parameters:totalParametersDictionary progress:nil success:successHandler failure:failureHandler];
            break;
        case MBHTTPMethodPost:
            [manager POST:urlString parameters:totalParametersDictionary progress:nil success:successHandler failure:failureHandler];
            break;
        case MBHTTPMethodPut:
            [manager PUT:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        case MBHTTPMethodPatch:
            [manager PATCH:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        case MBHTTPMethodDelete:
            [manager DELETE:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        default:
            break;
    }

}

+ (NSString *) deviceIdString {
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"MBPush"];
    id deviceIdFromUserDefaults = [userDefaults valueForKey:@"device_id"];
    if (deviceIdFromUserDefaults) {
        if ([deviceIdFromUserDefaults isKindOfClass: [NSString class]]){
            return deviceIdFromUserDefaults;
        }
    }
    
    NSString *deviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [userDefaults setObject:deviceId forKey:@"device_id"];
    [userDefaults synchronize];
    return deviceId;
}

+ (NSString *) messageErrorForResponseString: (NSString *) responseString {
    id json = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding]
                                              options:NSJSONReadingMutableContainers
                                                error:nil];
    if ([json isKindOfClass:[NSDictionary class]]){
        NSString *message = nil;
        NSDictionary *jsonDictionary = (NSDictionary *) json;
        if (jsonDictionary[@"message"]){
            message = jsonDictionary[@"message"];
        }
        if (jsonDictionary[@"errors"]){
            NSDictionary *errors = jsonDictionary[@"errors"];
            for (NSString *key in errors.allKeys){
                NSArray *errorsArray = errors[key];
                message = [message stringByAppendingFormat:@"\n%@", [errorsArray componentsJoinedByString:@"\n"]];
            }
        }
        return message;
    }
    return nil;
}

+ (NSString *) baseUrl {
    return @"https://push.mumbleserver.it/api";
}

@end
