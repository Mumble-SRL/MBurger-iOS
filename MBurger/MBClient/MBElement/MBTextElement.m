//
//  NKTextElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBTextElement.h"

@implementation MBTextElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Text: (NSString *) text{
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeText];
    if (self){
        self.text = text;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSString *text = dictionary[@"value"];
    return [self initWithElementId:elementId Name:name Order:order Text:text];
}

#pragma mark - Value

- (NSString *) value {
    return self.text;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.text = [aDecoder decodeObjectOfClass:NSString.class forKey:@"text"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_text forKey:@"text"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
