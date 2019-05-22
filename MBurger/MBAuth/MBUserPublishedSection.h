//
//  MBUserPublishedSection.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 22/05/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A section published by the user.
 */
@interface MBUserPublishedSection : NSObject<NSCoding, NSSecureCoding>

/**
 The id of the section
*/
@property (nonatomic, assign) NSInteger sectionId;

/**
 The id of the block of the section
*/
@property (nonatomic, assign) NSInteger blockId;

/**
 Initializes a published section object with the sectionId and blockId.
     
 @param sectionId The id of the section.
 @param blockId The id of the block of the section.
 @return A newly created MBUserPublishedSection initialized with the data passed.
*/
- (nonnull instancetype) initWithSectionId: (NSInteger) sectionId BlockId: (NSInteger) blockId;

/**
 Initializes an object with the dictionary returned by the api.
     
 @param dictionary The response from the api.
     
 @return A newly created MBUserPublishedSection initialized with the data of the dictionary.
*/
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end

