//
//  NKUploadableElement.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKMultipartForm.h"


/**
 An element can be uploaded when creating or editing a section.
 @note You should not use this class directly, use one of its subclasses.
 */
@interface NKUploadableElement : NSObject

/**
 The locale of the element. This is needed to construct the parameter name.
 
 @example it, en
 */
@property (nonatomic, retain, nullable) NSString *localeIdentifier;

/**
 The name/key of the element.
 */
@property (nonatomic, retain, nonnull) NSString *elementName;

/**
 Initializes an element with the name and the locale.
 
 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.

 @return A newly created NKUploadableElement initialized with the name and locale.
 */
- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier;


/**
 The name of the element, used when the element will be passed to the api.

 @return The name of the element.
 */
- (NSString *) parameterName;


/**
 Converts the element to an array of `NKMultipartForm` representing it.

 @return An array of `NKMultipartForm` representing the element.
 */
- (NSArray <NKMultipartForm *> *) toForm;

@end
