//
//  NKUploadableFilesElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKUploadableFilesElement.h"
#import "NKMultipartForm.h"

@implementation NKUploadableFilesElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier FileURLs: (NSArray <NSURL *> *) fileURLs{
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.fileURLs = fileURLs;
    }
    return self;
}

- (NSArray <NKMultipartForm *> *) toForm {
    NSMutableArray *form = [[NSMutableArray alloc] init];
    [self.fileURLs enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
        [form addObject:[[NKMultipartForm alloc] initWithName:[self parameterNameForIndex:idx] FileUrl:url MimeType:nil]];
    }];
    return form;
}

- (NSString *) parameterNameForIndex: (NSInteger) index {
    return [NSString stringWithFormat:@"%@[%ld]", [super parameterName], (long) index];
}

@end
