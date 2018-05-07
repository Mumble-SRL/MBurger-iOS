//
//  NKUploadableTextElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKUploadableElement.h"

@interface NKUploadableTextElement : NKUploadableElement

@property (nonatomic, retain, nonnull) NSString *text;

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Text: (NSString *) text;

@end
