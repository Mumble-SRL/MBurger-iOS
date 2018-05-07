//
//  NKUploadableTextElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKUploadableTextElement.h"

@implementation NKUploadableTextElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Text: (NSString *) text{
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.text = text;
    }
    return self;
}

- (NKMultipartForm *) toForm {
    return [[NKMultipartForm alloc] initWithName:[self parameterName] Data:[self.text dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
