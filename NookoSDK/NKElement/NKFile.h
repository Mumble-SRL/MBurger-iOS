//
//  NKMedia.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents a file.
 */
@interface NKFile : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the file.
 */
@property (nonatomic, assign) NSInteger fileId;

/**
 The url of the media.
 */
@property (nonatomic, retain, nonnull) NSURL *url;

/**
 The MIME type of the media.
 */
@property (nonatomic, retain, nonnull) NSString *mimeType;

/**
 The size of the media in byte.
 */
@property (nonatomic, assign) NSInteger size;

/**
 Initializes an image with the id, url, mimeType and size.
 
 @param fileId The id of the file.
 @param url The url of the element.
 @param mimeType The MIME type of the element.
 @param size The size of the image.
 
 @return A newly created NKImageElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithId: (NSInteger) fileId Url: (nonnull NSURL *) url MimeType: (nonnull NSString *) mimeType Size: (NSInteger) size;

/**
 Initializes a media with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return A newly created NKMedia initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;


@end
