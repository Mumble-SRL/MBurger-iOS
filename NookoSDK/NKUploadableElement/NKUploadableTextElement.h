//
//  NKUploadableTextElement.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKUploadableElement.h"


/**
 An uploadable element representing the text.
 When converted to form with `-[NKUploadableElement toForm]` is returned an array with a single object with name `elements[locale][name]` and value the data representing the text.
 */
@interface NKUploadableTextElement : NKUploadableElement


/**
 The text of the element.
 */
@property (nonatomic, retain, nonnull) NSString *text;


/**
 Initializes a text element with the name, the locale and a text.
 @see This function calls the super initializer `-[NKUploadableElement initWithElementName:LocaleIdentifier:]`

 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param text The text of the element.
 
 @return A newly created NKUploadableTextElement initialized with the name, locale and text.
 */
- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Text: (NSString *) text;

@end
