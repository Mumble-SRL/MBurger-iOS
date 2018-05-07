//
//  NKUploadableElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKUploadableElement.h"

@implementation NKUploadableElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier{
    self = [super init];
    if (self){
        self.elementName = elementName;
        self.localeIdentifier = localeIdentifier;
    }
    return self;
}

- (NKMultipartForm *) toForm {
    return nil;
}

- (NSString *) parameterName {
    return [NSString stringWithFormat:@"elements[%@][%@]", self.localeIdentifier, self.elementName];
}

@end
