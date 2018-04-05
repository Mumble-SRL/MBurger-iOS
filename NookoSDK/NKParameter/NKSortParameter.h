//
//  NKSortParameter.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKParameter.h"

/**
 A parameter used to sort the elements retuned.
 */
@interface NKSortParameter : NSObject <NKParameter>

/**
 The filed of the element used to sort.
 */
@property (nonatomic, retain, nonnull) NSString *field;

/**
 If the elements should be sorted in ascending order.
 */
@property (nonatomic, assign) BOOL ascending;

/**
 Creates and initializes a sort parameter object.
 
 @param field The filed of the element used to sort.
 @param ascending If the elements should be sorted in ascending order.
 
 @return a newly created NKSortParameter initialized with the data passed.
 */
- (instancetype _Nonnull) initWithField: (NSString * _Nonnull) field Ascending: (BOOL) ascending;

@end
