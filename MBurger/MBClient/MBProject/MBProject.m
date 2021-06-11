//
//  MBProject.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBProject.h"

@implementation MBProject

- (instancetype)initWithProjectId:(NSInteger)projectId Name:(NSString *)name Contracts:(NSArray<MBLegalContract *> *)contracts Beacons:(NSArray<MBBeacon *> *)beacons EvidenceInformations:(MBEvidenceInformations *)evidenceInformations{
    self = [super init];
    if (self){
        self.projectId = projectId;
        self.projectName = name;
        self.contracts = contracts;
        self.beacons = beacons;
        self.evidenceInformations = evidenceInformations;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    NSInteger projectId = [dictionary[@"id"] integerValue];
    NSString *projectName = dictionary[@"name"];
    NSArray *contracts = nil;
    if (dictionary[@"contracts"] != nil && dictionary[@"contracts"] != [NSNull null]){
        NSArray *contractsFromDictionary = dictionary[@"contracts"];
        NSMutableArray *mutableContracts = [[NSMutableArray alloc] init];
        for (NSDictionary *contractDictionary in contractsFromDictionary) {
            [mutableContracts addObject:[[MBLegalContract alloc] initWithDictionary:contractDictionary]];
        }
        contracts = mutableContracts;
    }
    NSArray *beacons = nil;
    if (dictionary[@"beacons"] != nil && dictionary[@"beacons"] != [NSNull null]){
        NSArray *contractsFromDictionary = dictionary[@"beacons"];
        NSMutableArray *mutableBeacons = [[NSMutableArray alloc] init];
        for (NSDictionary *contractDictionary in contractsFromDictionary) {
            [mutableBeacons addObject:[[MBBeacon alloc] initWithDictionary:contractDictionary]];
        }
        beacons = mutableBeacons;
    }
    MBEvidenceInformations *evidenceInformations;
    if (dictionary[@"evidence_id"] != nil && dictionary[@"evidence_id"] != [NSNull null]){
        evidenceInformations = [[MBEvidenceInformations alloc] initWithDictionary:dictionary];
    }
    return [self initWithProjectId:projectId Name:projectName Contracts:contracts Beacons:beacons EvidenceInformations:evidenceInformations];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[MBProject class]]){
        return [(MBProject *) object projectId] == self.projectId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.projectId = [aDecoder decodeIntegerForKey:@"projectId"];
        self.projectName = [aDecoder decodeObjectOfClass:NSString.class forKey:@"projectName"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:_projectId forKey:@"projectId"];
    [aCoder encodeObject:_projectName forKey:@"projectName"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
