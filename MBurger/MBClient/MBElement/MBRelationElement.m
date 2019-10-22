//
//  MBRelationElement.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 22/10/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBRelationElement.h"

@implementation MBRelationElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order BlockId: (NSInteger) blockId SectionId: (NSInteger) sectionId {
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeText];
    if (self){
        self.blockId = blockId;
        self.sectionId = sectionId;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSDictionary *valueDictionary = dictionary[@"value"];
    NSInteger blockId = [valueDictionary[@"block_id"] integerValue];
    NSInteger sectionId = [valueDictionary[@"section_id"] integerValue];

    return [self initWithElementId:elementId Name:name Order:order BlockId:blockId SectionId:sectionId];
}

#pragma mark - Value

- (id) value {
    return @{@"block_id": @(self.blockId),
             @"section_id": @(self.sectionId)};
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.blockId = [aDecoder decodeIntegerForKey:@"block_id"];
        self.sectionId = [aDecoder decodeIntegerForKey:@"section_id"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeInteger:_blockId forKey:@"block_id"];
    [aCoder encodeInteger:_sectionId forKey:@"section_id"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
