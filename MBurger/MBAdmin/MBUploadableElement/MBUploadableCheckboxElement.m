//
//  MBUploadableCheckboxElement.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 04/06/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBUploadableCheckboxElement.h"

@implementation MBUploadableCheckboxElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Value: (BOOL) value {
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.value = value;
    }
    return self;
}

- (NSArray <MBMultipartForm *> *) toForm {
    if (self.value){
        return [[NSArray alloc] initWithObjects:[[MBMultipartForm alloc] initWithName:[self parameterName] Data:[@"on" dataUsingEncoding:NSUTF8StringEncoding]], nil];
    } else {
        return nil;
    }
}

@end
