//
//  MBUploadableImagesElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBUploadableElement.h"

/**
 An uploadable element representing some images.
 When converted to form with `-[MBUploadableElement toForm]` is returned an array with objects with name `elements[locale][name][index]` and value the file in which the image is saved.
 */
@interface MBUploadableImagesElement : MBUploadableElement

/**
 The array of images.
 */
@property (nonatomic, retain, nonnull) NSArray <UIImage *> *images;


/**
 Initializes an images element with the name, the locale and an array of images.
 @see This function calls the super initializer `-[MBUploadableElement initWithElementName:LocaleIdentifier:]`

 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param images The images of the element.
 
 @return A newly created MBUploadableImagesElement initialized with the name, locale and images.
 */
- (nonnull instancetype) initWithElementName: (nonnull NSString *) elementName LocaleIdentifier: (nonnull NSString *) localeIdentifier Images: (nullable NSArray <UIImage *> *) images;

@end
