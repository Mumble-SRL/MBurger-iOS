//
//  MBGeneralElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"

/**
 This class represents a general MBurger element.
 */
@interface MBGeneralElement : MBElement <NSCoding, NSSecureCoding>

/**
 The value of the element.
 */
@property (nonatomic, retain, nullable) id generalValue;

/**
 The type of the element retuned by the api.
 */
@property (nonatomic, retain, nullable) NSString *type;

/**
 Initializes a date element with an elementId, a name, and its value.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param value The value representing the element.
 @param type The type of the element retuned by the api.

 @return A newly created MBGeneralElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Value: (nullable id) value Type: (NSString *) type;

@end
