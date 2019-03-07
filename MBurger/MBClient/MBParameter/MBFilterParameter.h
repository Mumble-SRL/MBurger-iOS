//
//  MBFilterParameter.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBParameter.h"

/**
 A parameter used to filter the elements retuned.
 */
@interface MBFilterParameter : NSObject <MBParameter>

/**
 The field used to filter.
 */
@property (nonatomic, retain, nonnull) NSString *field;

/**
 The value used to filter the elements.
 */
@property (nonatomic, retain, nonnull) NSString *value;

/**
 Creates and initializes a filter parameter object.
 
 @param field The field used to filter.
 @param value The value used to filter the elements.
 
 @return A newly created MBFilterParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field Value: (nonnull NSString *) value;

/**
 Creates and initializes a filter parameter object to filter the sections that have at least an element with name ? = `name` and value = `value`.
 @note This initializer calls `-[MBFilter initWithField:Value]` and the value becomes "name|value"

 @param field The field used to filter.
 @param name The name of the elements you want to filter with.
 @param value The value used to filter the elements.
 
 @return A newly created MBFilterParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field Name: (nonnull NSString*) name Value: (nonnull NSString *) value;

@end
