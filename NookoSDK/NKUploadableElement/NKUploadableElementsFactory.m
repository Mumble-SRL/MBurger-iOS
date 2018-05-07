//
//  NKUploadableElementsFactory.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
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

- (NKUploadableImageElement *) imageElementWithName: (NSString *) name Image: (UIImage *) image Index: (NSInteger) index{
    return [[NKUploadableImageElement alloc] initWithElementName:name LocaleIdentifier:self.localeIdentifier Image:image Index:index];
}

- (NKUploadableFileElement *) fileElementWithName: (NSString *) name FileURL: (NSURL *) fileUrl Index: (NSInteger) index{
    //TODO: implement
    return nil;
}

@end
