//
//  NKMedia.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 04/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents a media.
 */
@interface NKMedia : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the media.
 */
@property (nonatomic, assign) NSInteger mediaId;

/**
 The url of the media.
 */
@property (nonatomic, retain, nonnull) NSURL *url;

/**
 The Mime Type of the media.
 */
@property (nonatomic, retain, nonnull) NSString *mimeType;

/**
 The size of the media in byte.
 */
@property (nonatomic, assign) NSInteger size;

/**
 Initializes an image with the id, url, mimeType and size.
 
 @param mediaId The id of the media.
 @param url The url of the element.
 @param mimeType The Mime Type of the element.
 @param size The size of the image.
 
 @return a newly created NKImageElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithId: (NSInteger) mediaId Url: (NSURL * _Nonnull) url MimeType: (NSString * _Nonnull) mimeType Size: (NSInteger) size;

/**
 Initializes a media with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return a newly created NKMedia initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;


@end
