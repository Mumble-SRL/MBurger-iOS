//
//  NKUploadableImagesElement.m
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

#import "NKUploadableImagesElement.h"

@implementation NKUploadableImagesElement{
    NSString *_imageFolderPath;
}

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Images: (NSArray <UIImage *> *) images{
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.images = images;
        _imageFolderPath = [NSString stringWithFormat:@"Images_%f", [[NSDate date] timeIntervalSince1970]];
        NSString *cachesFilePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        NSString *folderPath = [cachesFilePath stringByAppendingPathComponent:_imageFolderPath];
        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
        [self.images enumerateObjectsUsingBlock:^(UIImage *img, NSUInteger idx, BOOL *stop) {
            NSString *filePath = [self filePathForIndex:idx];
            [UIImageJPEGRepresentation(img, 1.0) writeToFile:filePath atomically:YES];
        }];
    }
    return self;
}

- (NSArray <NKMultipartForm *> *) toForm {
    NSMutableArray *form = [[NSMutableArray alloc] init];
    [self.images enumerateObjectsUsingBlock:^(UIImage *img, NSUInteger idx, BOOL *stop) {
        NSString *filePath = [self filePathForIndex:idx];
        [form addObject:[[NKMultipartForm alloc] initWithName:[self parameterNameForIndex:idx] FileUrl:[NSURL fileURLWithPath:filePath] MimeType:@"image/jpeg"]];
    }];
    return form;;
}

- (NSString *) parameterNameForIndex: (NSInteger) index {
    return [NSString stringWithFormat:@"%@[%ld]", [super parameterName], (long) index];
}

- (NSString *) filePathForIndex: (NSInteger) index {
    NSString *cachesFilePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *folderPath = [cachesFilePath stringByAppendingPathComponent:_imageFolderPath];
    return [folderPath stringByAppendingPathComponent:[self fileNameForIndex:index]];
}

- (NSString *) fileNameForIndex: (NSInteger) index {
    return [NSString stringWithFormat:@"Image_%d.jpg", (int) index];
}

- (void) dealloc {
    if (_imageFolderPath){
        [[NSFileManager defaultManager] removeItemAtPath:_imageFolderPath error:nil];
    }
}

@end
