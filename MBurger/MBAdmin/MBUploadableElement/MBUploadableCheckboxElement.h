//
//  MBUploadableCheckboxElement.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 04/06/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBUploadableElement.h"

/**
 An uploadable element representing a checkbox.
 When converted to form with `-[MBUploadableElement toForm]` is returned an array with a single object with name `elements[locale][name]` if the value is true, otherwise it returns `nil`.
 */
@interface MBUploadableCheckboxElement : MBUploadableElement

/**
 The value of the checkbox.
 */
@property (nonatomic, assign) BOOL value;


/**
 Initializes a checkbox element with the name, the locale and a text.
 @see This function calls the super initializer `-[MBUploadableElement initWithElementName:LocaleIdentifier:]`
 
 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param value The value of the checkbox.
 
 @return A newly created MBUploadableCheckboxElement initialized with the name, locale and text.
 */
- (nonnull instancetype) initWithElementName: (nonnull NSString *) elementName LocaleIdentifier: (nonnull NSString *) localeIdentifier Value: (BOOL) value;


@end
