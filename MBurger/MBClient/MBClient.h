//
//  MBClient.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProject.h"
#import "MBBlock.h"
#import "MBPaginationInfo.h"
#import "MBParameter.h"

/**
 The main client of the SDK, this is your entry point for all the calls you do with MBurger.
 All the api calls have two blocks as parameters called when the api completes, one (Success) for the succes case and one for the failure (Failure). These blocks are pushed in the main thread by the SDK.
 When the return of the api is na array it's returned also a `MBPaginationInfo` object with the information about the pagination (total number of elements and the range of the elements returned)
 */
@interface MBClient : NSObject

#pragma mark - Project

/**
 Retrieve the informations about the project, it calls `-[MBClient getProjectIncludingContracts:Success:Failure]` with the paramter `includeContracts` setted to true.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the project returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getProjectWithSuccess: (nullable void (^)(MBProject * _Nonnull project)) success
                       Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the informations about the project.
 @param includeContracts if true contracts are included in the project
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the project returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getProjectIncludingContracts: (BOOL) includeContracts
                              Success: (nullable void (^)(MBProject * _Nonnull project)) success
                              Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Blocks

/**
 Retrieve the blocks of the project.
 @note This function calls `-[MBManager getBlocksWithParameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameters 'includeSections' and 'includeElements'
 @see `MBParameter`
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the ararray of blocks returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getBlocksWithParameters: (nullable NSArray <id<MBParameter>> *) parameters
                         Success: (nullable void (^)(NSArray <MBBlock *> * _Nonnull blocks, MBPaginationInfo * _Nonnull pagintaionInfo)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the blocks of the project.
 If includeSections is true the informations about the sections are included in the response.
 @note This function calls `-[MBManager getBlocksWithParameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameter 'includeElements'
 @see `MBParameter`
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the array of blocks returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getBlocksWithParameters: (nullable NSArray <id<MBParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                         Success: (nullable void (^)(NSArray <MBBlock *> * _Nonnull blocks, MBPaginationInfo * _Nonnull pagintaionInfo)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the blocks of the project.
 If includeSections is true the informations about the sections are included in the response.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @see `MBParameter`
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param includeElements If true the information of the elements in the sections of the blocks are included in the response, if the value of 'includeSections' is false the value of this parameter is ignored.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the array of blocks returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getBlocksWithParameters: (nullable NSArray <id<MBParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                     AndElements: (BOOL) includeElements
                         Success: (nullable void (^)(NSArray <MBBlock *> * _Nonnull blocks, MBPaginationInfo * _Nonnull pagintaionInfo)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the block of the project with the specified id.
 @note This function calls `-[MBManager getBlockWithBlockId:Parameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameters 'includeSections' and 'includeElements'
 @see `MBParameter`
 @param blockId The id of the block.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one arguments: the block returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (nullable NSArray <id<MBParameter>> *) parameters
                     Success: (nullable void (^)(MBBlock * _Nonnull block)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the block of the project with the specified id.
 If includeSections is true the informations about the sections are included in the response.
 @note This function calls `-[MBManager getBlockWithBlockId:Parameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameters 'includeSections' and 'includeElements'
 @see `MBParameter`
 @param blockId The id of the block.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the block returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (nullable NSArray <id<MBParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                     Success: (nullable void (^)(MBBlock * _Nonnull block)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the block of the project with the specified id.
 If includeSections is true the informations about the sections are included in the response.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @see `MBParameter`
 @param blockId The id of the block.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param includeElements If true the information of the elements in the sections of the blocks are included in the response, if the value of 'includeSections' is false the value of this parameter is ignored.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one arguments: the block returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (nullable NSArray <id<MBParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                 AndElements: (BOOL) includeElements
                     Success: (nullable void (^)(MBBlock * _Nonnull block)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Sections

/**
 Retrieve the sections of the block with the specified id.
 @note This function calls `-[MBManager getSectionsWithParameters:BlockId:IncludeElements:Success:Failure:]` with the default value of 'false' for the parameter 'includeElements'
 @see `MBParameter`
 @param blockId The id of the block that has the sections.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the array of sections returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (nullable NSArray <id<MBParameter>> *) parameters
                        Success: (nullable void (^)(NSArray <MBSection *> * _Nonnull sections, MBPaginationInfo * _Nonnull pagintaionInfo)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure;
/**
 Retrieve the sections of the block with the specified id.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @see `MBParameter`
 @param blockId The id of the block that has the sections.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeElements If true the information of the elements in the sections are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the array of sections returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (nullable NSArray <id<MBParameter>> *) parameters
                IncludeElements: (BOOL) includeElements
                        Success: (nullable void (^)(NSArray <MBSection *> * _Nonnull sections, MBPaginationInfo * _Nonnull pagintaionInfo)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


/**
 Retrieve the section with the specified id and all.
 @note This function calls `-[MBManager getSectionWithId:IncludeElements:Success:Failure:]` with the default value of 'false' for the parameter 'includeElements'
 @param sectionId The id of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the section returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getSectionWithId: (NSInteger) sectionId
                  Success: (nullable void (^)(MBSection * _Nonnull section)) success
                  Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the section with the specified id.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @param sectionId The id of the section.
 @param includeElements If true the information of the element in the section are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the section returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getSectionWithId: (NSInteger) sectionId
          IncludeElements: (BOOL) includeElements
                  Success: (nullable void (^)(MBSection * _Nonnull section)) success
                  Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Elements

/**
 Retrieve the elements of the section with the specified id.
 @param sectionId The id of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the elements of the sections returned by the api (the dictionary returned is like the one of the MBSection object).
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) getElementsWithSectionId: (NSInteger) sectionId
                          Success: (nullable void (^)(NSDictionary * _Nonnull elements)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


@end
