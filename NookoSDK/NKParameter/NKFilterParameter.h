//
//  NKFilterParameter.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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
 
 @return A newly created NKFilterParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field Value: (nonnull NSString *) value;

@end
