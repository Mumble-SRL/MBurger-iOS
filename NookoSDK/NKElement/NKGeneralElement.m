//
//  NKGeneralElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKGeneralElement.h"

@implementation NKGeneralElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Value: (id) value{
    self = [super initWithElementId:elementId Name:name Type:NKElementTypeUndefined];
    if (self){
        self.generalValue = value;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    id value = dictionary[@"value"];
    return [self initWithElementId:elementId Name:name Value:value];
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
