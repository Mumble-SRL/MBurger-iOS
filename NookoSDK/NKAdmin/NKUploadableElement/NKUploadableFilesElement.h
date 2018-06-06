//
//  NKUploadableFilesElement.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKUploadableElement.h"

/**
 An uploadable element representing some files.
 When converted to form with `-[NKUploadableElement toForm]` is returned an array with objects with name `elements[locale][name][index]` and value the file in which the image is saved.
 */
@interface NKUploadableFilesElement : NKUploadableElement

/**
 The URLs of the files.
 */
@property (nonatomic, retain, nonnull) NSArray <NSURL *> *fileURLs;

/**
 Initializes a files element with the name, the locale and an array of file URLs.
 @see This function calls the super initializer `-[NKUploadableElement initWithElementName:LocaleIdentifier:]`
 
 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param fileURLs The URLs of the files.
 
 @return A newly created NKUploadableFilesElement initialized with the name, locale and file URLs.
 */
- (nonnull instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier FileURLs: (NSArray <NSURL *> *) fileURLs;

@end
