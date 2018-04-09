//
//  NKImage.h
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
