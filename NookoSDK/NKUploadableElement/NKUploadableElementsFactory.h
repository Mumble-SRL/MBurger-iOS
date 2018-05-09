//
//  NKUploadableElementsFactory.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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
