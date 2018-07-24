//
//  MBUploadableFilesElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBUploadableFilesElement.h"
#import "MBMultipartForm.h"

@implementation MBUploadableFilesElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier FileURLs: (NSArray <NSURL *> *) fileURLs{
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.fileURLs = fileURLs;
    }
    return self;
}

- (NSArray <MBMultipartForm *> *) toForm {
    NSMutableArray *form = [[NSMutableArray alloc] init];
    [self.fileURLs enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
        [form addObject:[[MBMultipartForm alloc] initWithName:[self parameterNameForIndex:idx] FileUrl:url MimeType:nil]];
    }];
    return form;
}

- (NSString *) parameterNameForIndex: (NSInteger) index {
    return [NSString stringWithFormat:@"%@[%ld]", [super parameterName], (long) index];
}

@end
