//
//  NKMultipartForm.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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

- (instancetype) initWithName: (NSString *) name FileUrl: (NSURL *) fileURL MimeType: (NSString *) mimeType{
    self = [super init];
    if (self){
        self.name = name;
        self.fileURL = fileURL;
        self.mimeType = mimeType;
    }
    return self;
}

@end
