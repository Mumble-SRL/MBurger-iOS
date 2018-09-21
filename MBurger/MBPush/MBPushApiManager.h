//
//  MBPushApiManager.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBHTTPMethod.h"
#import "MBResponse.h"

/**
 This class is responsible to make all the networking requests to the MBurger Push Apis, MBPush is built above this class.
 */
@interface MBPushApiManager : NSObject

/**
 Calls the api to the MBurger Push endpoint with the parameters specified. At the end of the network call it will be called the success block or the failure block, if passed.
 @param pushToken The api token used to call the MBurger Push Api.
 @param apiName The name of the api to call.
 @param httpMethod The http method used to call the api.
 @param parameters The parameters passed with the api call.
 @param headerParameters The parameters passed in the header of the request with the api call.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the response of the api (a MBResponse).
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) callApiWithPushToken: (nonnull NSString  *) pushToken
                      ApiName: (nonnull NSString *) apiName
                   HTTPMethod: (MBHTTPMethod) httpMethod
                   Parameters: (nullable NSDictionary *) parameters
             HeaderParameters: (nullable NSDictionary *) headerParameters
                      Success: (nullable void (^)(MBResponse * _Nonnull response)) success
                      Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end
