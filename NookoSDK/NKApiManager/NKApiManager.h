//
//  NKApiManager.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 03/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKResponse.h"

/// The type of Http methods accepted
typedef NS_ENUM(NSUInteger, NKHTTPMethod) {
    /// Get method
    NKHTTPMethodGet,
    /// Post method
    NKHTTPMethodPost,
    /// Patch method
    NKHTTPMethodPatch,
    /// Put method
    NKHTTPMethodPut,
    /// Delete method
    NKHTTPMethodDelte,
};

/**
 This class is responsible to make all the networking requests to the Nooko Api, NKManager is built above this class.
 */
@interface NKApiManager : NSObject

/**
 Calls the api to the Nooko endpoint with the parameters specified. At the end of the network call it will be called the success block or the failure block, if passed.
 @param apiToken The api token used to call the Nooko Api.
 @param locale The locale passed to the api call.
 @param apiName The name of the api to call.
 @param httpMethod The http method used to call the api.
 @param parameters The parameters passed with the api call.
 @param headerParameters The parameters passed in the header of the request with the api call.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the response of the api (a NKResponse).
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) callApiWithApiToken: (NSString  * _Nonnull) apiToken
                      Locale: (NSString * _Nullable) locale
                     ApiName: (NSString * _Nonnull) apiName
                  HTTPMethod: (NKHTTPMethod) httpMethod
                  Parameters: (NSDictionary * _Nullable) parameters
            HeaderParameters: (NSDictionary * _Nullable) headerParameters
                     Success: (void (^ _Nullable)(NKResponse * _Nonnull response)) success
                     Failure: (void (^ _Nullable)(NSError * _Nonnull error)) failure;

@end
