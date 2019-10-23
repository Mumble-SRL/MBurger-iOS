//
//  MBPush.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//


#import "MBPush.h"
#import "MBManager.h"
#import "MBPushApiManager.h"

@implementation MBPush

+ (void) registerDeviceWithDeviceData: (NSData *) deviceData
                              Success: (void (^)(void)) success
                              Failure: (void (^)(NSError *error)) failure {
    NSString *pushToken = [self pushToken];
    if (pushToken == nil || [pushToken isEqualToString:@""]){
        if (failure){
            failure([self tokenError]);
        }
    }
    
    NSString *token = [self stringFromDeviceToken: deviceData];
    if (!token) {
        if (failure){
            failure([self tokenError]);
        }
    }
    
    NSDictionary *parameters = @{@"platform": @"ios",
                                 @"token": token};
    
    [MBPushApiManager callApiWithPushToken:pushToken
                                   ApiName:@"tokens"
                                HTTPMethod:MBHTTPMethodPost
                                Parameters:parameters
                          HeaderParameters:nil
                                   Success:^(MBResponse *response) {
                                       if(success){
                                           success();
                                       }
                                   }
                                   Failure:^(NSError *error) {
                                       if (failure){
                                           failure(error);
                                       }
                                   }];
}

+ (NSString *)stringFromDeviceToken: (NSData *)deviceToken {
    NSUInteger length = deviceToken.length;
    if (length == 0) {
        return nil;
    }
    const unsigned char *buffer = deviceToken.bytes;
    NSMutableString *hexString  = [NSMutableString stringWithCapacity:(length * 2)];
    for (int i = 0; i < length; ++i) {
        [hexString appendFormat:@"%02x", buffer[i]];
    }
    return [hexString copy];
}

+ (void) registerToTopic: (NSString *) topic
                 Success: (void (^)(void)) success
                 Failure: (void (^)(NSError *error)) failure {
    [self registerToTopics:@[topic] Success:success Failure:failure];
}

+ (void) registerToTopics: (NSArray <NSString *> *) topics
                  Success: (void (^)(void)) success
                  Failure: (void (^)(NSError *error)) failure {
    NSString *pushToken = [self pushToken];
    if (pushToken == nil || [pushToken isEqualToString:@""]){
        if (failure){
            failure([self tokenError]);
        }
        return;
    }
    
    NSDictionary *parameters = @{@"topics": [self jsonSrtingFromTopics:topics]};

    [MBPushApiManager callApiWithPushToken:pushToken
                                   ApiName:@"register"
                                HTTPMethod:MBHTTPMethodPost
                                Parameters:parameters
                          HeaderParameters:nil
                                   Success:^(MBResponse *response) {
                                       if(success){
                                           success();
                                       }
                                   }
                                   Failure:^(NSError *error) {
                                       if (failure){
                                           failure(error);
                                       }
                                   }];
}

+ (void) unregisterFromTopic: (NSString *) topic
                     Success: (void (^)(void)) success
                     Failure: (void (^)(NSError *error)) failure {
    [self unregisterFromTopics:@[topic] Success:success Failure:failure];
}

+ (void) unregisterFromTopics: (NSArray <NSString *> *) topics
                      Success: (void (^)(void)) success
                      Failure: (void (^)(NSError *error)) failure {
    NSString *pushToken = [self pushToken];
    if (pushToken == nil || [pushToken isEqualToString:@""]){
        if (failure){
            failure([self tokenError]);
        }
        return;
    }
    
    NSDictionary *parameters = @{@"topics": [self jsonSrtingFromTopics:topics]};

    [MBPushApiManager callApiWithPushToken:pushToken
                                   ApiName:@"unregister"
                                HTTPMethod:MBHTTPMethodPost
                                Parameters:parameters
                          HeaderParameters:nil
                                   Success:^(MBResponse *response) {
                                       if(success){
                                           success();
                                       }
                                   }
                                   Failure:^(NSError *error) {
                                       if (failure){
                                           failure(error);
                                       }
                                   }];
}

+ (void) unregisterFromAllTopicsWithSuccess: (void (^)(void)) success
                                    Failure: (void (^)(NSError *error)) failure {
    NSString *pushToken = [self pushToken];
    if (pushToken == nil || [pushToken isEqualToString:@""]){
        if (failure){
            failure([self tokenError]);
        }
        return;
    }
    
    [MBPushApiManager callApiWithPushToken:pushToken
                                   ApiName:@"unregister-all"
                                HTTPMethod:MBHTTPMethodPost
                                Parameters:nil
                          HeaderParameters:nil
                                   Success:^(MBResponse *response) {
                                       if(success){
                                           success();
                                       }
                                   }
                                   Failure:^(NSError *error) {
                                       if (failure){
                                           failure(error);
                                       }
                                   }];
}

+ (NSString *) jsonSrtingFromTopics: (NSArray <NSString *> * ) topics {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:topics options:0 error:&error];
    if (error != nil){
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

+ (NSError *) tokenError {
    NSError *error = [[NSError alloc] initWithDomain:@"com.mumble.mburger.push" code:101 userInfo:@{NSLocalizedDescriptionKey : @"Invalid push token"}];
    return error;
}

+ (NSString *) pushToken {
    return [MBManager sharedManager].pushToken;
}

@end
