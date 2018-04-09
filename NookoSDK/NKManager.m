//
//  NKManager.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKManager.h"
#import "NKApiManager.h"
#import "NKElementFactory.h"

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
    [NKApiManager callApiWithApiToken:self.apiToken
                               Locale:[self localeForApi]
                              ApiName:@"project"
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKProject *project = [[NKProject alloc] initWithDictionary:response.payload];
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

- (void) getBlocksWithParameters: (NSArray <id<NKParameter>> *) parameters
                         Success: (void (^)(NSArray <NKBlock *> *blocks, NKPaginationInfo *pagintaionInfo)) success
                         Failure: (void (^)(NSError * error)) failure{
    [self getBlocksWithParameters:parameters IncludingSections:FALSE AndElements:FALSE Success:success Failure:failure];
}

- (void) getBlocksWithParameters: (NSArray <id<NKParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                         Success: (void (^)(NSArray <NKBlock *> *blocks, NKPaginationInfo *pagintaionInfo)) success
                         Failure: (void (^)(NSError *error)) failure{
    [self getBlocksWithParameters:parameters IncludingSections:includeSections AndElements:FALSE Success:success Failure:failure];
}

- (void) getBlocksWithParameters: (NSArray <id<NKParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                     AndElements: (BOOL) includeElements
                         Success: (void (^)(NSArray <NKBlock *> *blocks, NKPaginationInfo *pagintaionInfo)) success
                         Failure: (void (^)(NSError *error)) failure{
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeSections){
        if (includeElements){
            parametersMutable[@"include"] = @"sections.elements";
        }
        else {
            parametersMutable[@"include"] = @"sections";
        }
    }
    for (id <NKParameter> parameter in parameters){
        [parametersMutable addEntriesFromDictionary:parameter.parameterRepresentation];
    }
    [NKApiManager callApiWithApiToken:self.apiToken
                               Locale:[self localeForApi]
                              ApiName:@"blocks"
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKPaginationInfo *pagintaionInfo = [[NKPaginationInfo alloc] initWithDictionary:response.payload[@"meta"]];
                                  NSMutableArray *blocks = [[NSMutableArray alloc] init];
                                  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                                      NSArray *items = response.payload[@"items"];
                                      for (NSDictionary *blockDictionary in items){
                                          [blocks addObject:[[NKBlock alloc] initWithDictionary:blockDictionary]];
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

- (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (NSArray <id<NKParameter>> *) parameters
                     Success: (void (^ _Nullable)(NKBlock *block)) success
                     Failure: (void (^ _Nullable)(NSError *error)) failure{
    [self getBlockWithBlockId:blockId Parameters:parameters IncludingSections:FALSE AndElements:FALSE Success:success Failure:failure];
}

- (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (NSArray <id<NKParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                     Success: (void (^ _Nullable)(NKBlock *block)) success
                     Failure: (void (^ _Nullable)(NSError *error)) failure{
    [self getBlockWithBlockId:blockId Parameters:parameters IncludingSections:includeSections AndElements:FALSE Success:success Failure:failure];
}

- (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (NSArray <id<NKParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                 AndElements: (BOOL) includeElements
                     Success: (void (^ _Nullable)(NKBlock *block)) success
                     Failure: (void (^ _Nullable)(NSError *error)) failure{
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeSections){
        if (includeElements){
            parametersMutable[@"include"] = @"sections.elements";
        }
        else {
            parametersMutable[@"include"] = @"sections";
        }
    }
    for (id <NKParameter> parameter in parameters){
        [parametersMutable addEntriesFromDictionary:parameter.parameterRepresentation];
    }
    [NKApiManager callApiWithApiToken:self.apiToken
                               Locale:[self localeForApi]
                              ApiName:[NSString stringWithFormat:@"blocks/%ld", blockId]
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKBlock *block = [[NKBlock alloc] initWithDictionary:response.payload];
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

- (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (NSArray <id<NKParameter>> *) parameters
                        Success: (void (^)(NSArray <NKSection *> *sections, NKPaginationInfo *pagintaionInfo)) success
                        Failure: (void (^)(NSError *error)) failure{
    [self getSectionsWithBlockId:blockId Parameters:parameters IncludeElements:FALSE Success:success Failure:failure];
}

- (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (NSArray <id<NKParameter>> *) parameters
                IncludeElements: (BOOL) includeElements
                        Success: (void (^)(NSArray <NKSection *> *sections, NKPaginationInfo *pagintaionInfo)) success
                        Failure: (void (^)(NSError *error)) failure{
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeElements){
        parametersMutable[@"include"] = @"elements";
    }
    for (id <NKParameter> parameter in parameters){
        [parametersMutable addEntriesFromDictionary:parameter.parameterRepresentation];
    }
    [NKApiManager callApiWithApiToken:self.apiToken
                               Locale:[self localeForApi]
                              ApiName:[NSString stringWithFormat:@"blocks/%ld/sections", (long) blockId]
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKPaginationInfo *paginationInfo = [[NKPaginationInfo alloc] initWithDictionary:response.payload[@"meta"]];
                                  NSMutableArray *sections = [[NSMutableArray alloc] init];
                                  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                                      NSArray *items = response.payload[@"items"];
                                      for (NSDictionary *sectionDictionary in items){
                                          [sections addObject:[[NKSection alloc] initWithDictionary:sectionDictionary]];
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

- (void) getSectionWithId: (NSInteger) sectionId
                  Success: (void (^)(NKSection *section)) success
                  Failure: (void (^)(NSError *error)) failure{
    [self getSectionWithId:sectionId IncludeElements:FALSE Success:success Failure:failure];
}

- (void) getSectionWithId:(NSInteger)sectionId
          IncludeElements:(BOOL)includeElements
                  Success:(void (^)(NKSection *))success
                  Failure:(void (^)(NSError *))failure {
    NSMutableDictionary *parametersMutable = [[NSMutableDictionary alloc] init];
    if (includeElements){
        parametersMutable[@"include"] = @"elements";
    }
    [NKApiManager callApiWithApiToken:self.apiToken
                               Locale:[self localeForApi]
                              ApiName:[NSString stringWithFormat:@"sections/%ld", (long) sectionId]
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:parametersMutable
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NKSection *section = [[NKSection alloc] initWithDictionary:response.payload];
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

- (void) getElementsWithSectionId: (NSInteger) sectionId
                          Success: (void (^)(NSDictionary *elements)) success
                          Failure: (void (^)(NSError *error)) failure{
    [NKApiManager callApiWithApiToken:self.apiToken
                               Locale:[self localeForApi]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/elements", (long) sectionId]
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                              Success:^(NKResponse *response) {
                                  NSDictionary *elementsDictionaryFromApi = response.payload[@"items"];
                                  NSMutableDictionary *elementsMutable = [[NSMutableDictionary alloc] init];
                                  for (NSString *key in elementsDictionaryFromApi.allKeys){
                                      NSDictionary *objectDict = elementsDictionaryFromApi[key];
                                      NKElement *e = [NKElementFactory elementsForDictionary:objectDict];
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

- (NSString *) localeForApi {
    if (self.locale){
        return [self stringForLocale:self.locale];
    }
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    if (preferredLanguages.count > 0){
        return [preferredLanguages.firstObject substringToIndex:2];
    }
    return [self stringForLocale:[NSLocale currentLocale]];
}

- (NSString *) stringForLocale: (NSLocale *) locale {
    return [locale.localeIdentifier substringToIndex:2];
}

- (NSDictionary *) buildDictionaryFromParameters: (NSArray <id<NKParameter>> *) parameters{
    NSMutableDictionary *totalDictionary = [[NSMutableDictionary alloc] init];
    for (id<NKParameter> parameter in parameters){
        [totalDictionary addEntriesFromDictionary:[parameter parameterRepresentation]];
    }
    return totalDictionary;
}

@end
