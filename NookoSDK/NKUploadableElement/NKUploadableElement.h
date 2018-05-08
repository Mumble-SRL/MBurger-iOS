//
//  NKUploadableElement.h
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
