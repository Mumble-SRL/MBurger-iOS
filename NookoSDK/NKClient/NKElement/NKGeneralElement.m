//
//  NKGeneralElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKGeneralElement.h"

@implementation NKGeneralElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Value: (id) value Type: (NSString *) type{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeUndefined];
    if (self){
        self.generalValue = value;
        self.type = type;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    id value = dictionary[@"value"];
    NSString *type = dictionary[@"type"];
    return [self initWithElementId:elementId Name:name Order:order Value:value Type: type];
}

#pragma mark - Value

- (id) value {
    return self.generalValue;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.generalValue = [aDecoder decodeObjectOfClass:NSString.class forKey:@"generalValue"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_generalValue forKey:@"generalValue"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
