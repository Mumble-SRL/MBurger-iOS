//
//  MBClient.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBClient.h"
#import "MBApiManager.h"
#import "MBManager.h"
#import "MBElementsFactory.h"

@implementation MBClient

#pragma mark - Project

+ (void) getProjectWithSuccess: (void (^)(MBProject * project)) success
                       Failure: (void (^)(NSError *error)) failure {
    [MBApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:@"project"
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBProject *project = [[MBProject alloc] initWithDictionary:response.payload];
                                  if (success){
                                      success(project);
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

#pragma mark - Blocks

+ (void) getBlocksWithParameters: (NSArray <id<MBParameter>> *) parameters
                         Success: (void (^)(NSArray <MBBlock *> *blocks, MBPaginationInfo *pagintaionInfo)) success
                         Failure: (void (^)(NSError * error)) failure {
    [self getBlocksWithParameters:parameters IncludingSections:FALSE AndElements:FALSE Success:success Failure:failure];
}

+ (void) getBlocksWithParameters: (NSArray <id<MBParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                         Success: (void (^)(NSArray <MBBlock *> *blocks, MBPaginationInfo *pagintaionInfo)) success
                         Failure: (void (^)(NSError *error)) failure {
    [self getBlocksWithParameters:parameters IncludingSections:includeSections AndElements:FALSE Success:success Failure:failure];
}

+ (void) getBlocksWithParameters: (NSArray <id<MBParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                     AndElements: (BOOL) includeElements
                         Success: (void (^)(NSArray <MBBlock *> *blocks, MBPaginationInfo *pagintaionInfo)) success
                         Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeSections){
        if (includeElements){
            parametersMutable[@"include"] = @"sections.elements";
        }
        else {
            parametersMutable[@"include"] = @"sections";
        }
    }
    for (id <MBParameter> parameter in parameters){
        [parametersMutable addEntriesFromDictionary:parameter.parameterRepresentation];
    }
    [MBApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:@"blocks"
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBPaginationInfo *pagintaionInfo = [[MBPaginationInfo alloc] initWithDictionary:response.payload[@"meta"]];
                                  NSMutableArray *blocks = [[NSMutableArray alloc] init];
                                  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                                      NSArray *items = response.payload[@"items"];
                                      for (NSDictionary *blockDictionary in items){
                                          [blocks addObject:[[MBBlock alloc] initWithDictionary:blockDictionary]];
                                      }
                                      dispatch_async(dispatch_get_main_queue(), ^(void){
                                          if (success){
                                              success(blocks, pagintaionInfo);
                                          }
                                      });
                                  });
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (NSArray <id<MBParameter>> *) parameters
                     Success: (void (^)(MBBlock *block)) success
                     Failure: (void (^)(NSError *error)) failure {
    [self getBlockWithBlockId:blockId Parameters:parameters IncludingSections:FALSE AndElements:FALSE Success:success Failure:failure];
}

+ (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (NSArray <id<MBParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                     Success: (void (^)(MBBlock *block)) success
                     Failure: (void (^)(NSError *error)) failure {
    [self getBlockWithBlockId:blockId Parameters:parameters IncludingSections:includeSections AndElements:FALSE Success:success Failure:failure];
}

+ (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (NSArray <id<MBParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                 AndElements: (BOOL) includeElements
                     Success: (void (^)(MBBlock *block)) success
                     Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeSections){
        if (includeElements){
            parametersMutable[@"include"] = @"sections.elements";
        }
        else {
            parametersMutable[@"include"] = @"sections";
        }
    }
    for (id <MBParameter> parameter in parameters){
        [parametersMutable addEntriesFromDictionary:parameter.parameterRepresentation];
    }
    [MBApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"blocks/%ld", (long) blockId]
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBBlock *block = [[MBBlock alloc] initWithDictionary:response.payload];
                                  if (success){
                                      success(block);
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

#pragma mark - Sections

+ (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (NSArray <id<MBParameter>> *) parameters
                        Success: (void (^)(NSArray <MBSection *> *sections, MBPaginationInfo *pagintaionInfo)) success
                        Failure: (void (^)(NSError *error)) failure {
    [self getSectionsWithBlockId:blockId Parameters:parameters IncludeElements:FALSE Success:success Failure:failure];
}

+ (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (NSArray <id<MBParameter>> *) parameters
                IncludeElements: (BOOL) includeElements
                        Success: (void (^)(NSArray <MBSection *> *sections, MBPaginationInfo *pagintaionInfo)) success
                        Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeElements){
        parametersMutable[@"include"] = @"elements";
    }
    for (id <MBParameter> parameter in parameters){
        [parametersMutable addEntriesFromDictionary:parameter.parameterRepresentation];
    }
    [MBApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"blocks/%ld/sections", (long) blockId]
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBPaginationInfo *paginationInfo = [[MBPaginationInfo alloc] initWithDictionary:response.payload[@"meta"]];
                                  NSMutableArray *sections = [[NSMutableArray alloc] init];
                                  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                                      NSArray *items = response.payload[@"items"];
                                      for (NSDictionary *sectionDictionary in items){
                                          [sections addObject:[[MBSection alloc] initWithDictionary:sectionDictionary]];
                                      }
                                      dispatch_async(dispatch_get_main_queue(), ^(void){
                                          if (success){
                                              success(sections, paginationInfo);
                                          }
                                      });
                                  });
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) getSectionWithId: (NSInteger) sectionId
                  Success: (void (^)(MBSection *section)) success
                  Failure: (void (^)(NSError *error)) failure {
    [self getSectionWithId:sectionId IncludeElements:FALSE Success:success Failure:failure];
}

+ (void) getSectionWithId:(NSInteger)sectionId
          IncludeElements:(BOOL)includeElements
                  Success:(void (^)(MBSection *))success
                  Failure:(void (^)(NSError *))failure {
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeElements){
        parametersMutable[@"include"] = @"elements";
    }
    [MBApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/", (long) sectionId]
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  MBSection *section = [[MBSection alloc] initWithDictionary:response.payload];
                                  if (success){
                                      success(section);
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

#pragma mark - Elements

+ (void) getElementsWithSectionId: (NSInteger) sectionId
                          Success: (void (^)(NSDictionary *elements)) success
                          Failure: (void (^)(NSError *error)) failure {
    [MBApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/elements", (long) sectionId]
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  NSDictionary *elementsDictionaryFromApi = response.payload[@"items"];
                                  NSMutableDictionary *elementsMutable = [[NSMutableDictionary alloc] init];
                                  for (NSString *key in elementsDictionaryFromApi.allKeys){
                                      NSDictionary *objectDict = elementsDictionaryFromApi[key];
                                      MBElement *e = [MBElementsFactory elementForDictionary:objectDict];
                                      if (e){
                                          elementsMutable[key] = e;
                                      }
                                  }
                                  if (success){
                                      success(elementsMutable ? elementsMutable : nil);
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

@end
