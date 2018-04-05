//
//  NKFilterParameter.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKParameter.h"

/**
 A parameter used to filter the elements retuned.
 */
@interface NKFilterParameter : NSObject <NKParameter>

/**
 The field used to filter.
 */
@property (nonatomic, retain, nonnull) NSString *field;

/**
 The value used to filter the elements.
 */
@property (nonatomic, retain, nonnull) NSString *value;

/**
 Creates and initializes a pagination parameter object.
 
 @param field The field used to filter.
 @param value The value used to filter the elements.
 
 @return a newly created NKFilterParameter initialized with the data passed.
 */
- (instancetype _Nonnull) initWithField: (NSString * _Nonnull) field Value: (NSString * _Nonnull) value;

@end
