//
//  MBImagesElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"
#import "MBImage.h"

/**
 This class represents a MBurger images element.
 */
@interface MBImagesElement : MBElement <NSCoding, NSSecureCoding>

/**
 The images of the element.
 */
@property (nonatomic, retain, nullable) NSArray <MBImage *> *images;

/**
 Initializes a images element with an elementId and its value (an array of images).
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param images The images of the element.
 
 @return A newly created MBImagesElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Images: (nullable NSArray <MBImage *> *) images;

/**
 It returns the first image of the element if exists.
 @return the frist image.
 */
- (nullable MBImage *) firstImage;

@end
