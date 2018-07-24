//
//  MBAdmin.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "MBAdmin.h"
#import "NKApiManager.h"
#import "MBManager.h"

@implementation MBAdmin

#pragma mark - Update sections

+ (void) addSectionToBlockWithBlockId: (NSInteger) blockId
                             Elements: (nonnull NSArray <MBUploadableElement *> *) elements
                              Success: (nullable void (^)(NSInteger sectionId)) success
                              Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    NSMutableArray *form = [[NSMutableArray alloc] init];
    for (MBUploadableElement *element in elements){
        for (NKMultipartForm *elementForm in element.toForm){
            [form addObject:elementForm];
        }
    }
    [NKApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"blocks/%ld/sections", (long) blockId]
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                        MultipartForm:form
                              Success:^(NKResponse *response) {
                                  NSInteger sectionId = [response.payload[@"id"] integerValue];
                                  if (success){
                                      success(sectionId);
                                  }
                              }
                              Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) editSectionWithSectionId: (NSInteger) sectionId
                         Elements: (nonnull NSArray <MBUploadableElement *> *) elements
                          Success: (nullable void (^)(void)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure{
    NSMutableArray *form = [[NSMutableArray alloc] init];
    for (MBUploadableElement *element in elements){
        for (NKMultipartForm *elementForm in element.toForm){
            [form addObject:elementForm];
        }
    }
    [NKApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/update", (long) sectionId]
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
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
    [NKApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"sections/%ld/", (long) sectionId]
                           HTTPMethod:NKHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
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
    [NKApiManager callApiWithApiToken:[MBManager sharedManager].apiToken
                               Locale:[[MBManager sharedManager] localeString]
                              ApiName:[NSString stringWithFormat:@"media/%ld/", (long) mediaId]
                           HTTPMethod:NKHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
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
