//
//  MBRelationSection.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 14/12/20.
//

#import "MBRelationSection.h"

@implementation MBRelationSection

- (nonnull instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    
    self.blockId = [dictionary[@"block_id"] integerValue];
    self.sectionId = [dictionary[@"section_id"] integerValue];
    
    return self;
}

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
