//
//  NKMediaElement.h
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

#import "NKElement.h"
#import "NKFile.h"

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
@property (nonatomic, retain, nullable) NSArray <NKFile *> *medias;

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
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Medias: (NSArray <NKFile *> * _Nullable) medias MediaType: (NKMediaType) mediaType;

/**
 It returns the first media of the element if exists.
 @return the frist media.
 */
- (NKFile * _Nullable) firstMedia;

@end
