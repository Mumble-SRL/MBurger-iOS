//
//  MBEvidenceInformations.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 15/10/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents the informations of the section in evidence.
 */
@interface MBEvidenceInformations : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the evidence object.
 */
@property (nonatomic, assign) NSInteger evidenceId;

/**
 The title in evidence.
 */
@property (nonatomic, retain, nonnull) NSString *title;

/**
 The url of the image in evidence.
 */
@property (nonatomic, retain, nonnull) NSURL *imageUrl;

/**
 The id of the section in evidence.
 */
@property (nonatomic, assign) NSInteger sectionId;

/**
 The id of the block of the section in evidence.
 */
@property (nonatomic, assign) NSInteger blockId;

/**
 Initializes an infomration object with the data.
 
 @param evidenceId The id of the evidence object.
 @param title The title in evidence.
 @param imageUrl The url of the image in evidence.
 @param sectionId The id of the section in evidence.
 @param blockId The id of the block of the section in evidence.

 @return A newly created MBEvidenceInformations initialized with the data.
 */
- (nonnull instancetype) initWithEvidenceId: (NSInteger) evidenceId Title: (nonnull NSString *) title ImageUrl: (nonnull NSURL *) imageUrl SectionId: (NSInteger) sectionId BlockId: (NSInteger) blockId;

/**
 Initializes a project with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return A newly created MBEvidenceInformations initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end

