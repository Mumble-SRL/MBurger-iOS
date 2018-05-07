//
//  NKMultipartForm.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKMultipartForm.h"

@implementation NKMultipartForm

- (instancetype) initWithName: (NSString *) name Data: (NSData *) data{
    self = [super init];
    if (self){
        self.name = name;
        self.data = data;
    }
    return self;
}

- (instancetype) initWithName: (NSString *) name FileUrl: (NSURL *) fileUrl MimeType: (NSString *) mimeType{
    self = [super init];
    if (self){
        self.name = name;
        self.fileURL = fileUrl;
        self.mimeType = mimeType;
    }
    return self;
}

@end
