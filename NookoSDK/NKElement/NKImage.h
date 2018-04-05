//
//  NKImage.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 04/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
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
 The Mime Type of the image.
 */
@property (nonatomic, retain, nonnull) NSString *mimeType;

/**
 The size of the image in byte.
 */
@property (nonatomic, assign) NSInteger size;

/**
 Initializes an image with the id, url, mimeType and size.
 
 @param imageId The id of the image.
 @param url The url of the element.
 @param mimeType The Mime Type of the element.
 @param size The size of the image.
 
 @return a newly created NKImageElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithId: (NSInteger) imageId Url: (NSURL * _Nonnull) url MimeType: (NSString * _Nonnull) mimeType Size: (NSInteger) size;

/**
 Initializes an image with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return a newly created NKImage initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

@end
