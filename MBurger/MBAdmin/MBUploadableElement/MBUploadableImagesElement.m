//
//  MBUploadableImagesElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBUploadableImagesElement.h"

@implementation MBUploadableImagesElement{
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
