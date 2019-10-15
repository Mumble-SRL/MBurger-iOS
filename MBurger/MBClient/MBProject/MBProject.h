//
//  MBProject.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBLegalContract.h"
#import "MBEvidenceInformations.h"

/**
 This class represents a MBurger project.
 */
@interface MBProject : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the project.
 */
@property (nonatomic, assign) NSInteger projectId;

/**
 The name of the project.
 */
@property (nonatomic, retain, nonnull) NSString *projectName;

/**
 The legal contracts of the project.
 */
@property (nonatomic, retain, nullable) NSArray <MBLegalContract *> *contracts;

/**
 The informations about the section in evidence, if present.
 */
@property (nonatomic, retain, nullable) MBEvidenceInformations *evidenceInformations;

/**
 Initializes a project with a projectId and the name returned by the api.
 
 @param projectId The id of the project.
 @param name The name of the project.
 @param contracts The legal contracts of the project.
 @param evidenceInformations The informations about the section in evidence, if present.

 @return A newly created MBProject initialized with the projectId and name.
 */
- (nonnull instancetype) initWithProjectId: (NSInteger) projectId Name: (nonnull NSString *) name Contracts: (nullable NSArray <MBLegalContract *> *) contracts EvidenceInformations: (nullable MBEvidenceInformations *) evidenceInformations;

/**
 Initializes a project with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return A newly created MBProject initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
