//
//  MBResponse.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represent a response from the MBurger api.
*/
@interface MBResponse : NSObject

/**
 The payload of the response.
 */
@property (nonatomic, retain, nullable) NSDictionary *payload;

/**
The task object created by AFNetworking when the API is called.
 */
@property (nonatomic, retain, nullable) NSURLSessionTask *dataTask;

@end
