//
//  MBBlock.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBBlock.h"

@implementation MBBlock

- (MBBlock *) initWithBlockId: (NSInteger) blockId Title: (NSString *) title Subtitle: (NSString *) subtitle Order: (NSInteger) order Sections: (NSArray <MBSection *> *) sections{
    self = [super init];
    if (self){
        self.blockId = blockId;
        self.title = title;
        self.subtitle = subtitle;
        self.order = order;
        if (sections){
            self.sections = sections;
        }
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger blockId = [dictionary[@"id"] integerValue];
    NSString *blockTitle = dictionary[@"title"];
    NSString *blockSubtitle = dictionary[@"subtitle"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSArray *sections = nil;
    if (dictionary[@"sections"] != nil && dictionary[@"sections"] != [NSNull null]){
        NSArray *sectionsDictionaries = dictionary[@"sections"];
        NSMutableArray *sectionsMutable = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in sectionsDictionaries){
            [sectionsMutable addObject:[[MBSection alloc] initWithDictionary:dictionary]];
        }
        sections = sectionsMutable;
    }
    return [self initWithBlockId:blockId Title:blockTitle Subtitle:blockSubtitle Order:order Sections:sections];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[MBBlock class]]){
        return [(MBBlock *) object blockId] == self.blockId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.blockId = [aDecoder decodeIntegerForKey:@"blockId"];
        self.title = [aDecoder decodeObjectOfClass:NSString.class forKey:@"title"];
        self.subtitle = [aDecoder decodeObjectOfClass:NSString.class forKey:@"subtitle"];
        self.order = [aDecoder decodeIntegerForKey:@"order"];
        self.sections = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"sections"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_blockId forKey:@"blockId"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_subtitle forKey:@"subtitle"];
    [aCoder encodeInteger:_order forKey:@"order"];
    [aCoder encodeObject:_sections forKey:@"sections"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"MBBlock with id: %ld", (long) self.blockId];
}

@end
