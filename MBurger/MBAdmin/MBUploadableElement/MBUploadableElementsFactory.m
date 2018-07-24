//
//  MBUploadableElementsFactory.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBUploadableElementsFactory.h"

@implementation MBUploadableElementsFactory

- (instancetype) initWithLocaleIdentifier: (NSString *) localeIdentifier{
    self = [super init];
    if (self){
        self.localeIdentifier = localeIdentifier;
    }
    return self;
}

- (MBUploadableTextElement *) textElementWithName: (NSString *) name Text: (NSString *) text{
    return [[MBUploadableTextElement alloc] initWithElementName:name LocaleIdentifier: self.localeIdentifier Text:text];
}

#pragma mark - Images

- (MBUploadableImagesElement *) imagesElementWithName: (NSString *) name Image: (UIImage *) image {
    return [[MBUploadableImagesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier Images:@[image]];
}

- (MBUploadableImagesElement *) imagesElementWithName: (NSString *) name Images: (NSArray <UIImage *> *) images{
    return [[MBUploadableImagesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier Images:images];
}

#pragma mark - Files

- (MBUploadableFilesElement *) filesElementWithName: (NSString *) name FileURL: (NSURL *) fileURL{
    return [[MBUploadableFilesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier FileURLs: @[fileURL]];
}

- (MBUploadableFilesElement *) filesElementWithName: (NSString *) name FileURLs: (NSArray <NSURL *> *) fileURLs{
    return [[MBUploadableFilesElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier FileURLs: fileURLs];
}

@end
