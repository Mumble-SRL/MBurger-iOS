//
//  NKDateElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko date element.
 */
@interface NKDateElement : NKElement <NSCoding, NSSecureCoding>

/**
 The value of the element.
*/
@property (nonatomic, retain, nullable) NSDate *date;

/**
 Initializes a date element with an elementId, a name, and its value.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param date The date of the element.
 
 @return a newly created NKWysiwygElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Date: (NSDate * _Nullable) date;

@end
