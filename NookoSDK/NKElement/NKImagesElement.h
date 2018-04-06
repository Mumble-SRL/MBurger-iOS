//
//  NKImageElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
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
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param images The images of the element.
 
 @return a newly created NKImageElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Images: (NSArray <NKImage *> * _Nullable) images;

/**
 It returns the first image of the element if exists.
 @return the frist image.
 */
- (NKImage * _Nullable) firstImage;

@end
