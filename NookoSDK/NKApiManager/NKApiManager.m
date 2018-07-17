
//
//  NKApiManager.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKApiManager.h"
#import "NKAuth.h"
#import <AFNetworking/AFNetworking.h>

@implementation NKApiManager

typedef void (^AFHTTPRequestOperationSuccessHandler) (NSURLSessionTask *operation, id responseObject);
typedef void (^AFHTTPRequestOperationFailureHandler) (NSURLSessionTask *operation, NSError *error);

+ (void) callApiWithApiToken: (NSString  *) apiToken
                      Locale: (NSString *) locale
                     ApiName: (NSString *) apiName
                  HTTPMethod: (NKHTTPMethod) httpMethod
                  Parameters: (NSDictionary *) parameters
            HeaderParameters: (NSDictionary *) headerParameters
                 Development: (BOOL) development
                     Success: (void (^)(NKResponse *response)) success
                     Failure: (void (^)(NSError *error)) failure{
    [self callApiWithApiToken:apiToken Locale:locale ApiName:apiName HTTPMethod:httpMethod Parameters:parameters HeaderParameters:headerParameters Development:development MultipartForm:nil Success:success Failure:failure];
}

+ (void) callApiWithApiToken: (NSString  *) apiToken
                      Locale: (NSString *) locale
                     ApiName: (NSString *) apiName
                  HTTPMethod: (NKHTTPMethod) httpMethod
                  Parameters: (NSDictionary *) parameters
            HeaderParameters: (NSDictionary *) headerParameters
                 Development: (BOOL) development
               MultipartForm: (nullable NSArray <NKMultipartForm *> *) multipartForm
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
    if (multipartForm != nil && httpMethod != NKHTTPMethodPost){
        NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.nooko" code:102 userInfo:@{NSLocalizedDescriptionKey : @"Can't send multipart form data with a method different than POST"}];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (failure){
                failure(error);
            }
        });
        return;
    }
    
    NSString *urlString = [self constructUrlWithApiname:apiName IsInDevelopment:development];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (httpMethod == NKHTTPMethodPost || httpMethod == NKHTTPMethodPut){
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }

    NSMutableDictionary *totalParametersDictionary = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    totalParametersDictionary[@"locale"] = locale;
    NSString *deviceIdString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    totalParametersDictionary[@"device_id"] = deviceIdString;

    for (NSString *key in headerParameters.allKeys){
        [manager.requestSerializer setValue:headerParameters[key] forHTTPHeaderField:key];
    }

    [manager.requestSerializer setValue:apiToken forHTTPHeaderField:@"X-Nooko-Token"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"X-Nooko-Version"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSString *accessToken = [NKAuth authToken];
    if (accessToken != nil && ![accessToken isEqualToString:@""]){
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", accessToken] forHTTPHeaderField:@"Authorization"];
    }
    
    AFHTTPRequestOperationSuccessHandler successHandler = ^(NSURLSessionTask *operation, id responseObject){
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [NKAuth performSelector:@selector(handleApiResponseAndSaveNewTokenIfPresentWithResponse:) withObject:operation.response];
#pragma clang diagnostic pop
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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [NKAuth performSelector:@selector(handleApiResponseAndSaveNewTokenIfPresentWithResponse:) withObject:operation.response];
#pragma clang diagnostic pop
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey]){
                NSString *responseString = [[NSString alloc] initWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                NSString *message = [self messageErrorForResponseString:responseString];
                if (message != nil){
                    if (failure){
                        NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.nooko" code:102 userInfo:@{NSLocalizedDescriptionKey : message}];
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
        case NKHTTPMethodGet:
            [manager GET:urlString parameters:totalParametersDictionary progress:nil success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodPost:
            if (multipartForm != nil){
                [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    for (NKMultipartForm *form in multipartForm){
                        if (form.data){
                            [formData appendPartWithFormData:form.data name:form.name];
                        }
                        else if (form.fileURL){
                            NSError *error = nil;
                            if (form.mimeType){
                                [formData appendPartWithFileURL:form.fileURL name:form.name fileName:form.fileURL.lastPathComponent mimeType:form.mimeType error:&error];
                            }
                            else {
                                [formData appendPartWithFileURL:form.fileURL name:form.name error:&error];
                            }
                        }
                    }
                } progress:nil success:successHandler failure:failureHandler];
            }
            else {
                [manager POST:urlString parameters:totalParametersDictionary progress:nil success:successHandler failure:failureHandler];
            }
            break;
        case NKHTTPMethodPut:
            [manager PUT:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodPatch:
            [manager PATCH:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        case NKHTTPMethodDelete:
            [manager DELETE:urlString parameters:totalParametersDictionary success:successHandler failure:failureHandler];
            break;
        default:
            break;
    }
}

+ (NSString *) constructUrlWithApiname: (NSString *) apiName IsInDevelopment: (BOOL) isInDevelopment {
    NSString *baseUrl = [self apiBaseUrl:isInDevelopment];
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

+ (NSString *) apiBaseUrl: (BOOL) isInDevelopment {
    if (isInDevelopment){
        return @"https://nooko2-dev.mumbleserver.it/api";
    }
    else {
        return @"https://nooko2.mumbleserver.it/api";
    }
}

@end
