//
//  MBUploadableElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBUploadableElement.h"

@implementation MBUploadableElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier{
    self = [super init];
    if (self){
        self.elementName = elementName;
        self.localeIdentifier = localeIdentifier;
    }
    return self;
}

- (NSArray <MBMultipartForm *> *) toForm {
    return nil;
}

- (NSString *) parameterName {
    return [NSString stringWithFormat:@"elements[%@][%@]", self.localeIdentifier, self.elementName];
}

@end
