//
//  MBUploadableColorElement.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 21/07/2020.
//  Copyright © 2020 Mumble. All rights reserved.
//

#import "MBUploadableColorElement.h"

@implementation MBUploadableColorElement

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier Color: (UIColor *) color {
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.color = color;
    }
    return self;
}

- (NSArray <MBMultipartForm *> *) toForm {
    NSString *hexString = [self hexStringForColor:self.color];
    return [[NSArray alloc] initWithObjects:[[MBMultipartForm alloc] initWithName:[self parameterName] Data:[hexString dataUsingEncoding:NSUTF8StringEncoding]], nil];
}

- (NSString *) hexStringForColor: (UIColor *) color {
      const CGFloat *components = CGColorGetComponents(color.CGColor);
      CGFloat r = components[0];
      CGFloat g = components[1];
      CGFloat b = components[2];
      NSString *hexString=[NSString stringWithFormat:@"#%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
      return hexString;
}

@end
