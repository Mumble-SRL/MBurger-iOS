//
//  MBRelationElement.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 22/10/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBRelationElement.h"

@implementation MBRelationElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Sections: (NSArray <MBRelationSection *>*) sections {
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeText];
    if (self){
        self.sections = sections;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    id value = dictionary[@"value"];
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    if ([value isKindOfClass: [NSArray class]]) {
        NSArray *valueArray = value;
        for (id sectionDict in valueArray) {
            if ([sectionDict isKindOfClass:[NSDictionary class]]) {
                [sections addObject:[[MBRelationSection alloc] initWithDictionary:sectionDict]];
            }
        }
    } else if ([value isKindOfClass:[NSDictionary class]]){
        [sections addObject:[[MBRelationSection alloc] initWithDictionary:value]];
    }
    
    return [self initWithElementId:elementId Name:name Order:order Sections:sections];
}

#pragma mark - Value

- (id) value {
    NSMutableArray *dicts = [[NSMutableArray alloc] init];
    for (MBRelationSection *section in self.sections) {
        [dicts addObject:@{@"section_id": @(section.sectionId),
                           @"block_id": @(section.blockId)}];
    }
    return dicts;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.sections = [aDecoder decodeObjectForKey:@"sections"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_sections forKey:@"sections"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
