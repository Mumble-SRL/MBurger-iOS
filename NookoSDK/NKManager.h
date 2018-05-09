//
//  NKManager.h
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import "NKProject.h"
#import "NKBlock.h"
#import "NKPaginationInfo.h"
#import "NKParameter.h"
#import "NKUploadableElement.h"

/**
 The manager of the SDK, this is your entry point for all the calls you do with Nooko.
 All the api calls have two blocks as parameters called when the api completes, one (Success) for the succes case and one for the failure (Failure). These blocks are pushed in the main thread by the SDK.
 When the return of the api is na array it's returned also a `NKPaginationInfo` object with the information about the pagination (total number of elements and the range of the elements returned)
 */
@interface NKManager : NSObject

/**
Creates and returns a singleton `NKManager`.
Use this object to make all the subsequent calls to the Nooko apis.
Don't allocate an instance of NKManager yourself.
 */
+ (nonnull NKManager *) sharedManager;

/**
The API token used to make all the requests to the api.
 */
@property (readwrite, nonatomic, strong, nullable) NSString *apiToken;

/**
 The locale used to make the requests.
 */
@property (readwrite, nonatomic, strong, nullable) NSLocale *locale;


/**
 The locale string sended to the api.

 @return The locale string sended to the api.
 */
- (NSString *) localeString;

#pragma mark - Project

/**
 Retrieve the informations about the project.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the project returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getProjectWithSuccess: (nullable void (^)(NKProject * _Nonnull project)) success
                       Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Blocks

/**
 Retrieve the blocks of the project.
 @note This function calls `-[NKManager getBlocksWithParameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameters 'includeSections' and 'includeElements'
 @see `NKParameter`
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the ararray of blocks returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getBlocksWithParameters: (nullable NSArray <id<NKParameter>> *) parameters
                         Success: (nullable void (^)(NSArray <NKBlock *> * _Nonnull blocks, NKPaginationInfo * _Nonnull pagintaionInfo)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the blocks of the project.
 If includeSections is true the informations about the sections are included in the response.
 @note This function calls `-[NKManager getBlocksWithParameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameter 'includeElements'
 @see `NKParameter`
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the array of blocks returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getBlocksWithParameters: (nullable NSArray <id<NKParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                         Success: (nullable void (^)(NSArray <NKBlock *> * _Nonnull blocks, NKPaginationInfo * _Nonnull pagintaionInfo)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the blocks of the project.
 If includeSections is true the informations about the sections are included in the response.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @see `NKParameter`
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param includeElements If true the information of the elements in the sections of the blocks are included in the response, if the value of 'includeSections' is false the value of this parameter is ignored.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the array of blocks returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getBlocksWithParameters: (nullable NSArray <id<NKParameter>> *) parameters
               IncludingSections: (BOOL) includeSections
                     AndElements: (BOOL) includeElements
                         Success: (nullable void (^)(NSArray <NKBlock *> * _Nonnull blocks, NKPaginationInfo * _Nonnull pagintaionInfo)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the block of the project with the specified id.
 @note This function calls `-[NKManager getBlockWithBlockId:Parameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameters 'includeSections' and 'includeElements'
 @see `NKParameter`
 @param blockId The id of the block.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one arguments: the block returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (nullable NSArray <id<NKParameter>> *) parameters
                     Success: (nullable void (^)(NKBlock * _Nonnull block)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the block of the project with the specified id.
 If includeSections is true the informations about the sections are included in the response.
 @note This function calls `-[NKManager getBlockWithBlockId:Parameters:IncludingSections:AndElements:Success:Failure:]` with the default value of 'false' for the parameters 'includeSections' and 'includeElements'
 @see `NKParameter`
 @param blockId The id of the block.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the block returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (nullable NSArray <id<NKParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                     Success: (nullable void (^)(NKBlock * _Nonnull block)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the block of the project with the specified id.
 If includeSections is true the informations about the sections are included in the response.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @see `NKParameter`
 @param blockId The id of the block.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeSections If true the information of the sections in the blocks are included in the response.
 @param includeElements If true the information of the elements in the sections of the blocks are included in the response, if the value of 'includeSections' is false the value of this parameter is ignored.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one arguments: the block returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getBlockWithBlockId: (NSInteger) blockId
                  Parameters: (nullable NSArray <id<NKParameter>> *) parameters
           IncludingSections: (BOOL) includeSections
                 AndElements: (BOOL) includeElements
                     Success: (nullable void (^)(NKBlock * _Nonnull block)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Sections

/**
 Retrieve the sections of the block with the specified id.
 @note This function calls `-[NKManager getSectionsWithParameters:BlockId:IncludeElements:Success:Failure:]` with the default value of 'false' for the parameter 'includeElements'
 @see `NKParameter`
 @param blockId The id of the block that has the sections.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the array of sections returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (nullable NSArray <id<NKParameter>> *) parameters
                        Success: (nullable void (^)(NSArray <NKSection *> * _Nonnull sections, NKPaginationInfo * _Nonnull pagintaionInfo)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure;
/**
 Retrieve the sections of the block with the specified id.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @see `NKParameter`
 @param blockId The id of the block that has the sections.
 @param parameters An optional array of parameters used to sort, filter orpaginate the blocks returned.
 @param includeElements If true the information of the elements in the sections are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes two arguments: the array of sections returned by the api and the informations about the pagination.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getSectionsWithBlockId: (NSInteger) blockId
                     Parameters: (nullable NSArray <id<NKParameter>> *) parameters
                IncludeElements: (BOOL) includeElements
                        Success: (nullable void (^)(NSArray <NKSection *> * _Nonnull sections, NKPaginationInfo * _Nonnull pagintaionInfo)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


/**
 Retrieve the section with the specified id and all.
 @note This function calls `-[NKManager getSectionWithId:IncludeElements:Success:Failure:]` with the default value of 'false' for the parameter 'includeElements'
 @param sectionId The id of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the section returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getSectionWithId: (NSInteger) sectionId
                  Success: (nullable void (^)(NKSection * _Nonnull section)) success
                  Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieve the section with the specified id.
 If includeElements is true the informations about the elements of the sections are included in the response.
 @param sectionId The id of the section.
 @param includeElements If true the information of the element in the section are included in the response.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the section returned by the api.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getSectionWithId: (NSInteger) sectionId
          IncludeElements: (BOOL) includeElements
                  Success: (nullable void (^)(NKSection * _Nonnull section)) success
                  Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Elements

/**
 Retrieve the elements of the section with the specified id.
 @param sectionId The id of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the elements of the sections returned by the api (the dictionary returned is like the one of the NKSection object).
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) getElementsWithSectionId: (NSInteger) sectionId
                          Success: (nullable void (^)(NSDictionary * _Nonnull elements)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Update sections

/**
 Add a section to the block with the specified id.
 @param blockId The id of the block the section will be added.
 @param elements An array of `NKUploadableElement` that will become the elements of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) addSectionToBlockWithBlockId: (NSInteger) blockId
                             Elements: (nonnull NSArray <NKUploadableElement *> *) elements
                              Success: (nullable void (^)(void)) success
                              Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Edit the section with the specified id.
 @param sectionId The id of the section.
 @param elements An array of `NKUploadableElement` that will be edited, you don't have to include the elements that will not be edited and only the elements passed will be modified with the new data.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) editSectionWithSectionId: (NSInteger) sectionId
                         Elements: (nonnull NSArray <NKUploadableElement *> *) elements
                          Success: (nullable void (^)(void)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Remove the section with the specified id.
 @param sectionId The id of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) deleteSectionWithSectionId: (NSInteger) sectionId
                            Success: (nullable void (^)(void)) success
                            Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


#pragma mark - Media

/**
 Remove the media (image or file) with the specified id.
 @param mediaId The id of the media.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
- (void) deleteMediaWithMediaId: (NSInteger) mediaId
                        Success: (nullable void (^)(void)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end
