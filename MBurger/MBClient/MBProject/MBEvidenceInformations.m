//
//  MBEvidenceInformations.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 15/10/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBEvidenceInformations.h"

@implementation MBEvidenceInformations

- (instancetype) initWithEvidenceId: (NSInteger) evidenceId Title: (NSString *) title ImageUrl: (NSURL *) imageUrl SectionId: (NSInteger) sectionId BlockId: (NSInteger) blockId {
    self = [super init];
    if (self){
        self.evidenceId = evidenceId;
        self.title = title;
        self.imageUrl = imageUrl;
        self.sectionId = sectionId;
        self.blockId = blockId;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    NSInteger evidenceId = [dictionary[@"evidence_id"] integerValue];
    NSString *title = dictionary[@"evidence_title"];
    NSString *imageString = dictionary[@"evidence_image"];
    NSURL *imageUrl = [[NSURL alloc] initWithString:imageString];
    NSInteger sectionId = [dictionary[@"evidence_section_id"] integerValue];
    NSInteger blockId = [dictionary[@"evidence_block_id"] integerValue];

    return [self initWithEvidenceId:evidenceId Title:title ImageUrl:imageUrl SectionId:sectionId BlockId:blockId];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[MBEvidenceInformations class]]){
        return [(MBEvidenceInformations *) object evidenceId] == self.evidenceId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.evidenceId = [aDecoder decodeIntegerForKey:@"evidenceId"];
        self.title = [aDecoder decodeObjectOfClass:NSString.class forKey:@"title"];
        self.imageUrl = [aDecoder decodeObjectOfClass:NSURL.class forKey:@"imageUrl"];
        self.sectionId = [aDecoder decodeIntegerForKey:@"sectionId"];
        self.blockId = [aDecoder decodeIntegerForKey:@"blockId"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:_evidenceId forKey:@"evidenceId"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_imageUrl forKey:@"imageUrl"];
    [aCoder encodeInteger:_sectionId forKey:@"sectionId"];
    [aCoder encodeInteger:_blockId forKey:@"blockId"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
