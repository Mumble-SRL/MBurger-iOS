//
//  NKImage.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents an image.
 */
@interface NKImage : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the image.
 */
@property (nonatomic, assign) NSInteger imageId;

/**
 The url of the image.
 */
@property (nonatomic, retain, nonnull) NSURL *url;

/**
 The MIME type of the image.
 */
@property (nonatomic, retain, nonnull) NSString *mimeType;

/**
 The size of the image in byte.
 */
@property (nonatomic, assign) NSInteger size;

/**
 Initializes an image with the id, url, MIME and size.
 
 @param imageId The id of the image.
 @param url The url of the element.
 @param mimeType The MIME type of the element.
 @param size The size of the image.
 
 @return A newly created NKImageElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithId: (NSInteger) imageId Url: (nonnull NSURL *) url MimeType: (nonnull NSString *) mimeType Size: (NSInteger) size;

/**
 Initializes an image with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return A newly created NKImage initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
