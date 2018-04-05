//
//  NKBlock.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKBlock.h"

@implementation NKBlock

- (NKBlock *) initWithBlockId: (NSInteger) blockId Name: (NSString *) name Sections: (NSArray <NKSection *> *) sections{
    self = [super init];
    if (self){
        self.blockId = blockId;
        self.name = name;
        if (sections){
            self.sections = sections;
        }
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger blockId = [dictionary[@"id"] integerValue];
    NSString *blockName = dictionary[@"name"];
    NSArray *sections = nil;
    if (dictionary[@"sections"] != nil && dictionary[@"sections"] != [NSNull null]){
        NSArray *sectionsDictionaries = dictionary[@"sections"];
        NSMutableArray *sectionsMutable = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in sectionsDictionaries){
            [sectionsMutable addObject:[[NKSection alloc] initWithDictionary:dictionary]];
        }
        sections = sectionsMutable;
    }
    return [self initWithBlockId:blockId Name:blockName Sections:sections];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"NKBlock with id: %ld", (long) self.blockId];
}

@end
