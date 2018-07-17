//
//  NKAdmin.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 09/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKAdmin.h"
#import "NKApiManager.h"
#import "NKManager.h"

@implementation NKAdmin

#pragma mark - Update sections

+ (void) addSectionToBlockWithBlockId: (NSInteger) blockId
                             Elements: (nonnull NSArray <NKUploadableElement *> *) elements
                              Success: (nullable void (^)(void)) success
                              Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    NSMutableArray *form = [[NSMutableArray alloc] init];
    for (NKUploadableElement *element in elements){
        for (NKMultipartForm *elementForm in element.toForm){
            [form addObject:elementForm];
        }
    }
    [NKApiManager callApiWithApiToken:[NKManager sharedManager].apiToken
                               Locale:[[NKManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"blocks/%ld/sections", (long) blockId]
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                        MultipartForm:form
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) editSectionWithSectionId: (NSInteger) sectionId
                         Elements: (nonnull NSArray <NKUploadableElement *> *) elements
                          Success: (nullable void (^)(void)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    NSMutableArray *form = [[NSMutableArray alloc] init];
    for (NKUploadableElement *element in elements){
        for (NKMultipartForm *elementForm in element.toForm){
            [form addObject:elementForm];
        }
    }
    [NKApiManager callApiWithApiToken:[NKManager sharedManager].apiToken
                               Locale:[[NKManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/update", (long) sectionId]
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                        MultipartForm:form
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) deleteSectionWithSectionId: (NSInteger) sectionId
                            Success: (nullable void (^)(void)) success
                            Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    [NKApiManager callApiWithApiToken:[NKManager sharedManager].apiToken
                               Locale:[[NKManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/", (long) sectionId]
                           HTTPMethod:NKHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

#pragma mark - Media

+ (void) deleteMediaWithMediaId: (NSInteger) mediaId
                        Success: (nullable void (^)(void)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    [NKApiManager callApiWithApiToken:[NKManager sharedManager].apiToken
                               Locale:[[NKManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"media/%ld/", (long) mediaId]
                           HTTPMethod:NKHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

@end
