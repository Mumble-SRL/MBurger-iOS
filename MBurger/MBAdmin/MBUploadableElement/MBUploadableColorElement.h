//
//  MBUploadableColorElement.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 21/07/2020.
//  Copyright © 2020 Mumble. All rights reserved.
//

#import "MBUploadableElement.h"
#import <UIKit/UIKit.h>

/**
An uploadable element representing a color.
When converted to form with `-[MBUploadableElement toForm]` is returned an array with a single object with name `elements[locale][name]` and value the hex value of the hex value of the color.
*/
@interface MBUploadableColorElement : MBUploadableElement

/**
 The text of the element.
 */
@property (nonatomic, retain, nonnull) UIColor *color;

/**
 Initializes a color element with the name, the locale and a color.
 @see This function calls the super initializer `-[MBUploadableElement initWithElementName:LocaleIdentifier:]`

 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param color The color of the element.
 
 @return A newly created MBUploadableColorElement initialized with the name, locale and color.
 */
- (nonnull instancetype) initWithElementName: (nonnull NSString *) elementName LocaleIdentifier: (nonnull NSString *) localeIdentifier Color: (nonnull UIColor *) color;

@end
