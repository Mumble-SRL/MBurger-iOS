//
//  NKApiManager.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKResponse.h"
#import "NKMultipartForm.h"

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
    NKHTTPMethodDelete,
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
 @param development If it's in development mode.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the response of the api (a NKResponse).
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) callApiWithApiToken: (nonnull NSString  *) apiToken
                      Locale: (nullable NSString *) locale
                     ApiName: (nonnull NSString *) apiName
                  HTTPMethod: (NKHTTPMethod) httpMethod
                  Parameters: (nullable NSDictionary *) parameters
            HeaderParameters: (nullable NSDictionary *) headerParameters
                 Development: (BOOL) development
                     Success: (nullable void (^)(NKResponse * _Nonnull response)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Calls the api to the Nooko endpoint with the parameters specified. At the end of the network call it will be called the success block or the failure block, if passed.
 @param apiToken The api token used to call the Nooko Api.
 @param locale The locale passed to the api call.
 @param apiName The name of the api to call.
 @param httpMethod The http method used to call the api.
 @param parameters The parameters passed with the api call.
 @param headerParameters The parameters passed in the header of the request with the api call.
 @param development If it's in development mode.
 @param multipartForm An array of `NKMultipartForm` passed as form data with the request.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the response of the api (a NKResponse).
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) callApiWithApiToken: (nonnull NSString  *) apiToken
                      Locale: (nullable NSString *) locale
                     ApiName: (nonnull NSString *) apiName
                  HTTPMethod: (NKHTTPMethod) httpMethod
                  Parameters: (nullable NSDictionary *) parameters
            HeaderParameters: (nullable NSDictionary *) headerParameters
                 Development: (BOOL) development
               MultipartForm: (nullable NSArray <NKMultipartForm *> *) multipartForm
                     Success: (nullable void (^)(NKResponse * _Nonnull response)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end
