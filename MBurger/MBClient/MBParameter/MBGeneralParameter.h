//
//  MBGeneralParameter.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBParameter.h"

/**
 A general parameter passed to the MBurger Api.
 */
@interface MBGeneralParameter : NSObject <MBParameter>

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
 
 @return A newly created MBGeneralParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithKey: (nonnull NSString *) key Value: (nonnull NSString *) value;

@end
