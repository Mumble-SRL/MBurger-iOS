//
//  NKElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKElement.h"

@implementation NKElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Type: (NKElementType) elementType{
    self = [super init];
    if (self){
        self.elementId = elementId;
        self.name = name;
        self.order = order;
        self.elementType = elementType;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NKElementType elementType = NKElementTypeUndefined;
    return [self initWithElementId:elementId Name:name Order:order Type:elementType];
}

- (id) value{
    return nil;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[NKElement class]]){
        return [(NKElement *) object elementId] == self.elementId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.elementId = [aDecoder decodeIntegerForKey:@"elementId"];
        self.name = [aDecoder decodeObjectOfClass:NSString.class forKey:@"name"];
        self.elementType = [aDecoder decodeIntegerForKey:@"elementType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_elementId forKey:@"elementId"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_elementType forKey:@"elementType"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description 

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with id: %ld", NSStringFromClass(self.class), (long) self.elementId];
}

@end
