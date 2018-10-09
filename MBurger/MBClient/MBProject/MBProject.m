//
//  MBProject.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBProject.h"

@implementation MBProject

- (instancetype) initWithProjectId: (NSInteger) projectId Name: (NSString *) name Contracts: (NSArray <MBLegalContract *> *) contracts {
    self = [super init];
    if (self){
        self.projectId = projectId;
        self.projectName = name;
        self.contracts = contracts;
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
    return [self initWithProjectId:projectId Name:projectName Contracts:contracts];
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
