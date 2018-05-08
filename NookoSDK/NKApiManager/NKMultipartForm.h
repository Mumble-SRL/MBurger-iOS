//
//  NKMultipartForm.h
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
 A Form object used to pass data from the NKManager class to the NKApiManager
 */
@interface NKMultipartForm : NSObject

/**
 The name of the parameter.
 */
@property (nonatomic, retain, nonnull) NSString *name;

/**
 The data of the form.
 */
@property (nonatomic, retain, nullable) NSData *data;

/**
 The url of the file.
 */
@property (nonatomic, retain, nullable) NSURL *fileURL;

/**
 The MIME type of the file.
 */
@property (nonatomic, retain, nullable) NSString *mimeType;

/**
 Initializes an element with the name and some data.
 
 @param name The name of the parameter.
 @param data The data of the form.

 @return A newly created NKMultipartForm initialized with the name and data.
 */
- (instancetype) initWithName: (nonnull NSString *) name Data: (nonnull NSData *) data;

/**
 Initializes an element with the name, a fileUrl and the MIME type of the file.
 
 @param name The name of the parameter.
 @param fileURL The url of the file.
 @param mimeType The MIME type of the file.

 @return A newly created NKMultipartForm initialized with the name and data.
 */
- (instancetype) initWithName: (nonnull NSString *) name FileUrl: (nonnull NSURL *) fileURL MimeType: (nullable NSString *) mimeType;

@end
