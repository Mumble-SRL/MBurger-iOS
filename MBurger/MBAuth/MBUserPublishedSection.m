//
//  MBUserPublishedSection.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 22/05/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBUserPublishedSection.h"

@implementation MBUserPublishedSection

- (instancetype) initWithSectionId: (NSInteger) sectionId BlockId: (NSInteger) blockId {
    self = [super init];
    if (self){
        self.sectionId = sectionId;
        self.blockId = blockId;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    NSInteger sectionId = [dictionary[@"id"] integerValue];
    NSInteger blockId = [dictionary[@"block_id"] integerValue];
    return [self initWithSectionId:sectionId BlockId:blockId];
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.sectionId = [aDecoder decodeIntegerForKey:@"sectionId"];
        self.blockId = [aDecoder decodeIntegerForKey:@"blockId"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_sectionId forKey:@"sectionId"];
    [aCoder encodeInteger:_blockId forKey:@"blockId"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}


@end
