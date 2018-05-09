//
//  NKResponse.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represent a response from the Nooko api.
*/
@interface NKResponse : NSObject

/**
 The payload of the response.
 */
@property (nonatomic, retain, nullable) NSDictionary *payload;

/**
The task object created by AFNetworking when the API is called.
 */
@property (nonatomic, retain, nullable) NSURLSessionTask *dataTask;

@end
