//
//  NKMediaElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"
#import "NKMedia.h"

/// The type of media
typedef NS_ENUM(NSUInteger, NKMediaType) {
    /// A general file
    NKMediaTypeFile,
    /// An audio
    NKMediaTypeAudio,
    /// A video
    NKMediaTypeVideo,
    /// A document (e.g. pdf)
    NKMediaTypeDocument
};

/**
 This class represents a Nooko media element.
 */
@interface NKMediaElement : NKElement <NSCoding, NSSecureCoding>

/**
 The type of media.
 */
@property (nonatomic, assign) NKMediaType mediaType;

/**
 The medias of the element.
 */
@property (nonatomic, retain, nullable) NSArray <NKMedia *> *medias;

/**
 Initializes a media element with an elementId, the name and its value, the mediaURL becomes the value passed by this function.
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param medias The medias.
 @param mediaType The type of the media.

 @return a newly created NKMediaElement initialized with the elementId, the name, the value passed and the media type.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Medias: (NSArray <NKMedia *> * _Nullable) medias MediaType: (NKMediaType) mediaType;

/**
 It returns the first media of the element if exists.
 @return the frist media.
 */
- (NKMedia * _Nullable) firstMedia;

@end
