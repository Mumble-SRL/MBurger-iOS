//
//  MBMediaElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"
#import "MBFile.h"

/// The type of media
typedef NS_ENUM(NSUInteger, MBMediaType) {
    /// A general file
    MBMediaTypeFile,
    /// An audio
    MBMediaTypeAudio,
    /// A video
    MBMediaTypeVideo,
    /// A document (e.g. pdf)
    MBMediaTypeDocument
};

/**
 This class represents a Nooko media element.
 */
@interface MBMediaElement : MBElement <NSCoding, NSSecureCoding>

/**
 The type of media.
 */
@property (nonatomic, assign) MBMediaType mediaType;

/**
 The medias of the element.
 */
@property (nonatomic, retain, nullable) NSArray <MBFile *> *medias;

/**
 Initializes a media element with an elementId, the name and its value, the mediaURL becomes the value passed by this function.
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param medias The medias.
 @param mediaType The type of the media.

 @return A newly created MBMediaElement initialized with the elementId, the name, the value passed and the media type.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Medias: (nullable NSArray <MBFile *> *) medias MediaType: (MBMediaType) mediaType;

/**
 It returns the first media of the element if exists.
 @return the frist media.
 */
- (nullable MBFile *) firstMedia;

@end
