//
//  NKUploadableElementsFactory.h
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
#import "NKUploadableTextElement.h"
#import "NKUploadableImagesElement.h"
#import "NKUploadableFilesElement.h"

/**
 Utility class used to create NKUploadableElement objects without specifiyng the locale for every object.
 The locale is initialized with the factory and passed to all the objects. You can also change the locale and use the same instance of a NKUploadableElementsFactory to create objects with a different locale.
 */
@interface NKUploadableElementsFactory : NSObject


/**
 The locale identifier passed to every objects created.
 
 @example it, en
 */
@property (nonatomic, retain, nonnull) NSString *localeIdentifier;


/**
 Initializes a factory with the locale identifier.

 @param localeIdentifier The locale identifier.
 
 @return A newly created NKUploadableElementsFactory with the given locale.
 */
- (instancetype) initWithLocaleIdentifier: (NSString *) localeIdentifier;


/**
 Creates a text element.

 @param name The name of the element.
 @param text The text.
 
 @return An `NKUploadableTextElement` with the name and text specified.
 */
- (NKUploadableTextElement *) textElementWithName: (NSString *) name Text: (NSString *) text;

#pragma mark - Images


/**
 Creates an images element with a single image.

 @param name The name of the element.
 @param image The image of the element.
 
 @return An `NKUploadableImagesElement` with the name and image specified.
 */
- (NKUploadableImagesElement *) imagesElementWithName: (NSString *) name Image: (UIImage *) image;

/**
 Creates an images element with an array of images.
 
 @param name The name of the element.
 @param images The images of the element.
 
 @return An `NKUploadableImagesElement` with the name and images specified.
 */
- (NKUploadableImagesElement *) imagesElementWithName: (NSString *) name Images: (NSArray <UIImage *> *) images;

#pragma mark - Files

/**
 Creates a files element with a single file.
 
 @param name The name of the element.
 @param fileUrl The file of the element.
 
 @return An `NKUploadableFilesElement` with the name and file specified.
 */
- (NKUploadableFilesElement *) filesElementWithName: (NSString *) name FileURL: (NSURL *) fileUrl;

/**
 Creates an files element with an array of files.
 
 @param name The name of the element.
 @param fileUrls The files of the element.
 
 @return An `NKUploadableFilesElement` with the name and files specified.
 */
- (NKUploadableFilesElement *) filesElementWithName: (NSString *) name FileURLs: (NSArray <NSURL *> *) fileUrls;

@end
