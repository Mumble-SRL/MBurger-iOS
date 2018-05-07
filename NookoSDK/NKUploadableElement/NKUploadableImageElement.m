//
//  NKUploadableImageElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKUploadableImageElement.h"

@implementation NKUploadableImageElement{
    NSString *_fileName;
}

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Image: (UIImage *) image Index: (NSInteger) index{
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.image = image;
        self.index = index;
    }
    return self;
}

- (NSString *) parameterName {
    return [NSString stringWithFormat:@"%@[%ld]", [super parameterName], (long) self.index];
}

- (NKMultipartForm *) toForm {
    NSString *filePath = [self filePath];
    [UIImageJPEGRepresentation(self.image, 1.0) writeToFile:filePath atomically:YES];
    return [[NKMultipartForm alloc] initWithName:self.parameterName FileUrl:[NSURL fileURLWithPath:filePath] MimeType:@"image/jpeg"];
}

- (NSString *) filePath {
    NSString *cachesFilePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    return [cachesFilePath stringByAppendingPathComponent:[self fileName]];
}

- (NSString *) fileName {
    if (_fileName){
        return _fileName;
    }
    return [NSString stringWithFormat:@"%@%f.jpg", _fileName, [[NSDate date] timeIntervalSince1970]];
}

- (void) dealloc {
    if (_fileName){
        [[NSFileManager defaultManager] removeItemAtPath:[self filePath] error:nil];
    }
}

@end
