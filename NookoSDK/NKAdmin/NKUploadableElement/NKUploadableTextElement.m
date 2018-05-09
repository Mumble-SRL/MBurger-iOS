//
//  NKUploadableTextElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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

- (NSArray <NKMultipartForm *> *) toForm {
    return [[NSArray alloc] initWithObjects:[[NKMultipartForm alloc] initWithName:[self parameterName] Data:[self.text dataUsingEncoding:NSUTF8StringEncoding]], nil];
}

@end
