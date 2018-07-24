//
//  NKMultipartForm.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A Form object used to pass data from the MBManager class to the NKApiManager
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
- (nonnull instancetype) initWithName: (nonnull NSString *) name Data: (nonnull NSData *) data;

/**
 Initializes an element with the name, a fileUrl and the MIME type of the file.
 
 @param name The name of the parameter.
 @param fileURL The url of the file.
 @param mimeType The MIME type of the file.

 @return A newly created NKMultipartForm initialized with the name and data.
 */
- (nonnull instancetype) initWithName: (nonnull NSString *) name FileUrl: (nonnull NSURL *) fileURL MimeType: (nullable NSString *) mimeType;

@end
