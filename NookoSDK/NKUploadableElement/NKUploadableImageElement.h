//
//  NKUploadableImageElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NKUploadableElement.h"

@interface NKUploadableImageElement : NKUploadableElement

//TODO change to array
@property (nonatomic, retain, nonnull) UIImage *image;
@property (nonatomic, assign) NSInteger index;

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Image: (UIImage *) image Index: (NSInteger) index;

@end
