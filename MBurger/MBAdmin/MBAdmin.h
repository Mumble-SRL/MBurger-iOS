//
//  MBAdmin.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBUploadableElement.h"

/**
 Manages the calls to the admin MBurger apis.
 */
@interface MBAdmin : NSObject

#pragma mark - Update sections

/**
 Add a section to the block with the specified id.
 @param blockId The id of the block the section will be added.
 @param elements An array of `MBUploadableElement` that will become the elements of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the id of the section created.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) addSectionToBlockWithBlockId: (NSInteger) blockId
                             Elements: (nonnull NSArray <MBUploadableElement *> *) elements
                              Success: (nullable void (^)(NSInteger sectionId)) success
                              Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Edit the section with the specified id.
 @param sectionId The id of the section.
 @param elements An array of `MBUploadableElement` that will be edited, you don't have to include the elements that will not be edited and only the elements passed will be modified with the new data.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) editSectionWithSectionId: (NSInteger) sectionId
                         Elements: (nonnull NSArray <MBUploadableElement *> *) elements
                          Success: (nullable void (^)(void)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Remove the section with the specified id.
 @param sectionId The id of the section.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) deleteSectionWithSectionId: (NSInteger) sectionId
                            Success: (nullable void (^)(void)) success
                            Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


#pragma mark - Media

/**
 Remove the media (image or file) with the specified id.
 @param mediaId The id of the media.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) deleteMediaWithMediaId: (NSInteger) mediaId
                        Success: (nullable void (^)(void)) success
                        Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end
