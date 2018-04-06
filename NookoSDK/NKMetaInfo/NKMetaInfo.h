//
//  NKMetaInfo.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class contains meta information abaut the pagination, it's usually returned when an array is requested by the api.
 */
@interface NKMetaInfo : NSObject

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

 @return a newly created NKMetaInfo initialized with the data passed.
 */
- (instancetype _Nonnull) initWithFrom: (NSInteger) from To: (NSInteger) to Total: (NSInteger) total;

/**
 Initializes a meta info object with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return a newly created NKMetaInfo initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

@end
