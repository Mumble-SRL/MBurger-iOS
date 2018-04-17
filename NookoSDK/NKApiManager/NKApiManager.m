
//
//  NKApiManager.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 03/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKApiManager.h"

#import "AFNetworking.h"

static NSString *apiBaseUrl = @"https://nooko2.mumbleserver.it/api";

@implementation NKApiManager

typedef void (^AFHTTPRequestOperationSuccessHandler) (NSURLSessionTask *operation, id responseObject);
typedef void (^AFHTTPRequestOperationFailureHandler) (NSURLSessionTask *operation, NSError *error);

+ (void) callApiWithApiToken: (NSString  *) apiToken
                      Locale: (NSString *) locale
                     ApiName: (NSString *) apiName
                  HTTPMethod: (NKHTTPMethod) httpMethod
                  Parameters: (NSDictionary *) parameters
            HeaderParameters: (NSDictionary *) headerParameters
                     Success: (void (^)(NKResponse *response)) success
                     Failure: (void (^)(NSError *error)) failure{
    if (apiToken == nil || [apiToken isEqualToString:@""]){
        NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.nooko" code:101 userInfo:@{NSLocalizedDescriptionKey : @"Invalid api token"}];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failure){
                failure(error);
            }
        });
        return;
    }
    NSString *urlString = [self constructUrlWithApiname:apiName];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (httpMethod == NKHTTPMethodPost || httpMethod == NKHTTPMethodPut){
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }

    NSMutableDictionary *totalParametersDictionary = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    totalParametersDictionary[@"locale"] = locale;
    
    for (NSString *key in headerParameters.allKeys){
        [manager.requestSerializer setValue:headerParameters[key] forHTTPHeaderField:key];
    }

    [manager.requestSerializer setValue:apiToken forHTTPHeaderField:@"X-Nooko-Token"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"X-Nooko-Version"];
    [manager.requestSerializer setValue:@"accept/json" forHTTPHeaderField:@"Accept"];
    
    AFHTTPRequestOperationSuccessHandler successHandler = ^(NSURLSessionTask *operation, id responseObject){
        NSDictionary *response = (NSDictionary *) responseObject;
        if (response[@"response"] && response[@"response"] != [NSNull null]){
            NSDictionary *responseDict = response[@"response"];
            NSInteger statusCode = [responseDict[@"status_code"] integerValue];
            if (statusCode == 0){
                NKResponse *response = [[NKResponse alloc] init];
                response.payload = responseDict[@"body"];
                response.dataTask = operation;
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success){
                        success(response);
                    }
                });
            }
            else {
                NSString *message = responseDict[@"message"] ? responseDict[@"message"] : @"";
                NSString *messageLocalized = responseDict[@"message_localized"] ? responseDict[@"message_localized"] : @"";
                NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.nooko" code:statusCode userInfo:@{NSLocalizedDescriptionKey : messageLocalized, NSDebugDescriptionErrorKey : message}];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (failure){
                        failure(error);
                    }
                });
            }
        }
        else {
            NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.nooko" code:100 userInfo:@{NSLocalizedDescriptionKey : @"Can't find response"}];
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
            if (failure){
                failure(error);
            }
        });
    };
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
    switch (httpMethod) {
        case NKHTTPMethodGet:
            [manager GET:urlString parameters:totalParametersDictionary progress:nil success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodPost:
            [manager POST:urlString parameters:totalParametersDictionary progress:nil success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodPut:
            [manager PUT:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodPatch:
            [manager PATCH:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodDelte:
            [manager DELETE:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        default:
            break;
    }
}

+ (NSString *) constructUrlWithApiname: (NSString *) apiName {
    NSString *baseUrl = apiBaseUrl;
    if (![baseUrl hasSuffix:@"/"]){
        baseUrl = [baseUrl stringByAppendingString:@"/"];
    }
    NSString *realApiName = apiName;
    if ([realApiName hasPrefix:@"/"]){
        realApiName = [realApiName substringFromIndex: 1];
    }
    if ([realApiName hasSuffix:@"/"]){
        realApiName = [realApiName substringToIndex:realApiName.length-1];
    }
    return [baseUrl stringByAppendingString:realApiName];
}

@end
