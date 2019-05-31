//
//  MBUploadableElementsFactory.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBUploadableTextElement.h"
#import "MBUploadableImagesElement.h"
#import "MBUploadableFilesElement.h"

/**
 Utility class used to create MBUploadableElement objects without specifiyng the locale for every object.
 The locale is initialized with the factory and passed to all the objects. You can also change the locale and use the same instance of a MBUploadableElementsFactory to create objects with a different locale.
 */
@interface MBUploadableElementsFactory : NSObject


/**
 The locale identifier passed to every objects created.
 
 @example it, en
 */
@property (nonatomic, retain, nonnull) NSString *localeIdentifier;


/**
 Initializes a factory with the locale identifier.

 @param localeIdentifier The locale identifier.
 
 @return A newly created MBUploadableElementsFactory with the given locale.
 */
- (nonnull instancetype) initWithLocaleIdentifier: (nonnull NSString *) localeIdentifier;


/**
 Creates a text element.

 @param name The name of the element.
 @param text The text.
 
 @return An `MBUploadableTextElement` with the name and text specified.
 */
- (nonnull MBUploadableTextElement *) textElementWithName: (nonnull NSString *) name Text: (nonnull NSString *) text;

#pragma mark - Images


/**
 Creates an images element with a single image.

 @param name The name of the element.
 @param image The image of the element.
 
 @return An `MBUploadableImagesElement` with the name and image specified.
 */
- (nonnull MBUploadableImagesElement *) imagesElementWithName: (nonnull NSString *) name Image: (nonnull UIImage *) image;

/**
 Creates an images element with a single image.
 
 @param name The name of the element.
 @param image The image of the element.
 @param compressionQuality The compression quality of the image (from 0 to 1).

 @return An `MBUploadableImagesElement` with the name and image specified.
 */
- (nonnull MBUploadableImagesElement *) imagesElementWithName: (nonnull NSString *) name Image: (nonnull UIImage *) image CompressionQuality: (CGFloat) compressionQuality;

/**
 Creates an images element with an array of images.
 
 @param name The name of the element.
 @param images The images of the element.
 
 @return An `MBUploadableImagesElement` with the name and images specified.
 */
- (nonnull MBUploadableImagesElement *) imagesElementWithName: (nonnull NSString *) name Images: (nonnull NSArray <UIImage *> *) images;

/**
 Creates an images element with an array of images.
 
 @param name The name of the element.
 @param images The images of the element.
 @param compressionQuality The compression quality of the image (from 0 to 1).
 
 @return An `MBUploadableImagesElement` with the name and images specified.
 */
- (nonnull MBUploadableImagesElement *) imagesElementWithName: (nonnull NSString *) name Images: (nonnull NSArray <UIImage *> *) images CompressionQuality: (CGFloat) compressionQuality;

#pragma mark - Files

/**
 Creates a files element with a single file.
 
 @param name The name of the element.
 @param fileUrl The file of the element.
 
 @return An `MBUploadableFilesElement` with the name and file specified.
 */
- (nonnull MBUploadableFilesElement *) filesElementWithName: (nonnull NSString *) name FileURL: (nonnull NSURL *) fileUrl;

/**
 Creates an files element with an array of files.
 
 @param name The name of the element.
 @param fileUrls The files of the element.
 
 @return An `MBUploadableFilesElement` with the name and files specified.
 */
- (nonnull MBUploadableFilesElement *) filesElementWithName: (nonnull NSString *) name FileURLs: (nonnull NSArray <NSURL *> *) fileUrls;

@end
