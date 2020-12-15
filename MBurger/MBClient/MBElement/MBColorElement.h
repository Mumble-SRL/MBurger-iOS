//
//  MBColorElement.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 06/05/2020.
//  Copyright © 2020 Mumble. All rights reserved.
//

#import "MBElement.h"
#import <UIKit/UIKit.h>

/**
This class represents a MBurger color element.
*/
@interface MBColorElement : MBElement <NSCoding, NSSecureCoding>

/**
 The hex value of the element.
 */
@property (nonatomic, retain, nullable) NSString *colorHex;

/**
 Initializes a color element with an elementId and its value.
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param colorHex The hex color of the element.
 
 @return A newly created MBColorElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order ColorHex: (nullable NSString *) colorHex;

/**
Retturns the color of this element
@return the color of this element.
*/
- (nullable UIColor *) color;

@end
