//
//  NKImageElement.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKElement.h"
#import "NKImage.h"

/**
 This class represents a Nooko images element.
 */
@interface NKImagesElement : NKElement <NSCoding, NSSecureCoding>

/**
 The images of the element.
 */
@property (nonatomic, retain, nullable) NSArray <NKImage *> *images;

/**
 Initializes a images element with an elementId and its value (an array of images).
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param images The images of the element.
 
 @return A newly created NKImageElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Images: (nullable NSArray <NKImage *> *) images;

/**
 It returns the first image of the element if exists.
 @return the frist image.
 */
- (nullable NKImage *) firstImage;

@end
