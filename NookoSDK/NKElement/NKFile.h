//
//  NKMedia.h
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
