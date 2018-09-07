//
//  MBUploadableTextElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBUploadableTextElement.h"

@implementation MBUploadableTextElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Text: (NSString *) text{
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.text = text;
    }
    return self;
}

- (NSArray <MBMultipartForm *> *) toForm {
    return [[NSArray alloc] initWithObjects:[[MBMultipartForm alloc] initWithName:[self parameterName] Data:[self.text dataUsingEncoding:NSUTF8StringEncoding]], nil];
}

@end
