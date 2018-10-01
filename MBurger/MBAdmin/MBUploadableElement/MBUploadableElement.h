//
//  MBUploadableElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBMultipartForm.h"

/**
 An element can be uploaded when creating or editing a section.
 @note You should not use this class directly, use one of its subclasses.
 */
@interface MBUploadableElement : NSObject

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

 @return A newly created MBUploadableElement initialized with the name and locale.
 */
- (nonnull instancetype) initWithElementName: (nonnull NSString *) elementName LocaleIdentifier: (nonnull NSString *) localeIdentifier;


/**
 The name of the element, used when the element will be passed to the api.

 @return The name of the element.
 */
- (nonnull NSString *) parameterName;


/**
 Converts the element to an array of `MBMultipartForm` representing it.

 @return An array of `MBMultipartForm` representing the element.
 */
- (nullable NSArray <MBMultipartForm *> *) toForm;

@end
