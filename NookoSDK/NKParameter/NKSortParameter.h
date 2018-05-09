//
//  NKSortParameter.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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
 Creates and initializes a sort parameter object, the sorting will be ascending.
 
 @param field The filed of the element used to sort.

 @return A newly created NKSortParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field;

/**
 Creates and initializes a sort parameter object.
 
 @param field The filed of the element used to sort.
 @param ascending If the elements should be sorted in ascending order.
 
 @return A newly created NKSortParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field Ascending: (BOOL) ascending;

@end
