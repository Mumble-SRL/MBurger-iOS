//
//  NKUploadableImagesElement.h
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
#import <UIKit/UIKit.h>
#import "NKUploadableElement.h"

/**
 An uploadable element representing some images.
 When converted to form with `-[NKUploadableElement toForm]` is returned an array with objects with name `elements[locale][name][index]` and value the file in which the image is saved.
 */
@interface NKUploadableImagesElement : NKUploadableElement

/**
 The array of images.
 */
@property (nonatomic, retain, nonnull) NSArray <UIImage *> *images;


/**
 Initializes an images element with the name, the locale and an array of images.
 @see This function calls the super initializer `-[NKUploadableElement initWithElementName:LocaleIdentifier:]`

 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param images The images of the element.
 
 @return A newly created NKUploadableImagesElement initialized with the name, locale and images.
 */
- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Images: (NSArray <UIImage *> *) images;

@end
