//
//  NKMultipartForm.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKMultipartForm : NSObject

@property (nonatomic, retain, nonnull) NSString *name;

@property (nonatomic, retain, nullable) NSData *data;

@property (nonatomic, retain, nullable) NSURL *fileURL;
@property (nonatomic, retain, nullable) NSString *mimeType;

- (instancetype) initWithName: (NSString *) name Data: (NSData *) data;
- (instancetype) initWithName: (NSString *) name FileUrl: (NSURL *) fileUrl MimeType: (NSString *) mimeType;

@end
