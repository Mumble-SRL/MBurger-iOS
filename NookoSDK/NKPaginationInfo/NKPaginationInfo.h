//
//  NKPaginationInfo.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class contains meta information abaut the pagination, it's usually returned when an array is requested by the api.
 */
@interface NKPaginationInfo : NSObject

/**
 The starting index.
 */
@property (nonatomic, assign) NSInteger from;

/**
 The ending index.
 */
@property (nonatomic, assign) NSInteger to;

/**
 The total number of elements of that type on Nooko.
 */
@property (nonatomic, assign) NSInteger total;

/**
 Initializes a meta info object with the properties.
 
 @param from The starting index.
 @param to The ending index.
 @param total The total number of elements of that type on Nooko.

 @return A newly created NKPaginationInfo initialized with the data passed.
 */
- (nonnull instancetype) initWithFrom: (NSInteger) from To: (NSInteger) to Total: (NSInteger) total;

/**
 Initializes a meta info object with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return A newly created NKPaginationInfo initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
