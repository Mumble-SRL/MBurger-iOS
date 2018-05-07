//
//  NKUploadableElementsFactory.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NKUploadableTextElement.h"
#import "NKUploadableImageElement.h"
#import "NKUploadableFileElement.h"

@interface NKUploadableElementsFactory : NSObject

@property (nonatomic, retain, nonnull) NSString *localeIdentifier;

- (instancetype) initWithLocaleIdentifier: (NSString *) localeIdentifier;

- (NKUploadableTextElement *) textElementWithName: (NSString *) name Text: (NSString *) text;
- (NKUploadableImageElement *) imageElementWithName: (NSString *) name Image: (UIImage *) image Index: (NSInteger) index;
- (NKUploadableFileElement *) fileElementWithName: (NSString *) name FileURL: (NSURL *) fileUrl Index: (NSInteger) index;

@end
