//
//  NKManager.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKManager.h"

@implementation NKManager

+ (NKManager *) sharedManager {
    static NKManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void) getProjectWithSuccess: (void (^)(NKProject * project)) success
                       Failure: (void (^)(NSError *error)) failure {
    //TODO: implement
}

- (void) getBlocksWithParameters: (NSArray <id<NKParameter>> *) parameters
                         Success: (void (^)(NSArray <NKBlock *> *blocks, NKMetaInfo *metaInfo)) success
                         Failure: (void (^)(NSError * error)) failure{
    [self getBlocksWithParameters:parameters IncludingSections:FALSE AndElements:FALSE Success:success Failure:failure];
}

- (void) getBlocksWithParameters: (NSArray <id<NKParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                         Success: (void (^)(NSArray <NKBlock *> *blocks, NKMetaInfo *metaInfo)) success
                         Failure: (void (^)(NSError *error)) failure{
    [self getBlocksWithParameters:parameters IncludingSections:includeSections AndElements:FALSE Success:success Failure:failure];
}

- (void) getBlocksWithParameters: (NSArray <id<NKParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                     AndElements: (BOOL) includeElements
                         Success: (void (^)(NSArray <NKBlock *> *blocks, NKMetaInfo *metaInfo)) success
                         Failure: (void (^)(NSError *error)) failure{
    //TODO: implement
}

- (void) getSectionsWithParameters: (NSArray <id<NKParameter>> *) parameters
                           BlockId: (NSInteger) blockId
                           Success: (void (^)(NSArray <NKSection *> *sections, NKMetaInfo *metaInfo)) success
                           Failure: (void (^)(NSError *error)) failure{
    [self getSectionsWithParameters:parameters BlockId:blockId IncludeElements:FALSE Success:success Failure:failure];
}

- (void) getSectionsWithParameters: (NSArray <id<NKParameter>> *) parameters
                           BlockId: (NSInteger) blockId
                   IncludeElements: (BOOL) includeElements
                           Success: (void (^)(NSArray <NKSection *> *sections, NKMetaInfo *metaInfo)) success
                           Failure: (void (^)(NSError *error)) failure{
    //TODO: implement
}

- (void) getSectionWithId: (NSInteger) sectionId
                  Success: (void (^)(NKSection *section)) success
                  Failure: (void (^)(NSError *error)) failure{
    [self getSectionWithId:sectionId IncludeElements:FALSE Success:success Failure:failure];
}

- (void) getSectionWithId:(NSInteger)sectionId
          IncludeElements:(BOOL)includeElements
                  Success:(void (^)(NKSection *))success
                  Failure:(void (^)(NSError *))failure {
    //TODO: implement
}

- (NSDictionary *) buildDictionaryFromParameters: (NSArray <id<NKParameter>> *) parameters{
    NSMutableDictionary *totalDictionary = [[NSMutableDictionary alloc] init];
    for (id<NKParameter> parameter in parameters){
        [totalDictionary addEntriesFromDictionary:[parameter parameterRepresentation]];
    }
    return totalDictionary;
}

@end
