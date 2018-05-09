//
//  NKUploadableElementsFactory.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKUploadableElementsFactory.h"

@implementation NKUploadableElementsFactory

- (instancetype) initWithLocaleIdentifier: (NSString *) localeIdentifier{
    self = [super init];
    if (self){
        self.localeIdentifier = localeIdentifier;
    }
    return self;
}

- (NKUploadableTextElement *) textElementWithName: (NSString *) name Text: (NSString *) text{
    return [[NKUploadableTextElement alloc] initWithElementName:name LocaleIdentifier: self.localeIdentifier Text:text];
}

#pragma mark - Images

- (NKUploadableImagesElement *) imagesElementWithName: (NSString *) name Image: (UIImage *) image {
    return [[NKUploadableImagesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier Images:@[image]];
}

- (NKUploadableImagesElement *) imagesElementWithName: (NSString *) name Images: (NSArray <UIImage *> *) images{
    return [[NKUploadableImagesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier Images:images];
}

#pragma mark - Files

- (NKUploadableFilesElement *) filesElementWithName: (NSString *) name FileURL: (NSURL *) fileURL{
    return [[NKUploadableFilesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier FileURLs: @[fileURL]];
}

- (NKUploadableFilesElement *) filesElementWithName: (NSString *) name FileURLs: (NSArray <NSURL *> *) fileURLs{
    return [[NKUploadableFilesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier FileURLs: fileURLs];
}

@end
