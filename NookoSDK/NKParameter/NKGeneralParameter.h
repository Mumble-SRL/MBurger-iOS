//
//  NKGeneralParameter.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKParameter.h"

/**
 A general parameter passed to the Nooko Api.
 */
@interface NKGeneralParameter : NSObject <NKParameter>

/**
 The key of the parameter.
 */
@property (nonatomic, retain, nonnull) NSString *key;

/**
 The value of the parameter.
 */
@property (nonatomic, retain, nonnull) NSString *value;

/**
 Creates and initializes a parameter object.
 
 @param key The key of the parameter.
 @param value The value of the parameter.
 
 @return a newly created NKGeneralParameter initialized with the data passed.
 */
- (instancetype _Nonnull) initWithKey: (NSString * _Nonnull) key Value: (NSString * _Nonnull) value;

@end
