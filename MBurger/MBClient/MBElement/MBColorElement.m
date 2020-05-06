//
//  MBColorElement.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 06/05/2020.
//  Copyright © 2020 Mumble. All rights reserved.
//

#import "MBColorElement.h"

@implementation MBColorElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order ColorHex: (NSString *) colorHex {
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeColor];
    if (self){
        self.colorHex = colorHex;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSString *hex = dictionary[@"value"];
    return [self initWithElementId:elementId Name:name Order:order ColorHex:hex];
}

#pragma mark - Value

- (id) value {
    return [self color];
}

- (UIColor *) color {
   unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self.colorHex];
   [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
   [scanner scanHexInt:&rgbValue];
   return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.colorHex = [aDecoder decodeObjectOfClass:NSString.class forKey:@"colorHex"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_colorHex forKey:@"colorHex"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}


@end
