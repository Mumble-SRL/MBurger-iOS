//
//  NKGeneralElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a general Nooko element.
 */
@interface NKGeneralElement : NKElement <NSCoding, NSSecureCoding>

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
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param value The value representing the element.
 @param type The type of the element retuned by the api.

 @return a newly created NKGeneralElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Value: (id _Nullable) value Type: (NSString *) type;

@end
