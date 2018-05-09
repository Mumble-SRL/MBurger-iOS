//
//  NKProject.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents a Nooko project.
 */
@interface NKProject : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the project.
 */
@property (nonatomic, assign) NSInteger projectId;

/**
 The name of the project.
 */
@property (nonatomic, retain, nonnull) NSString *projectName;

/**
 Initializes a project with a projectId and the name returned by the api.
 
 @param projectId The id of the project.
 @param name The name of the project.
 
 @return A newly created NKProject initialized with the projectId and name.
 */
- (nonnull instancetype) initWithProjectId: (NSInteger) projectId Name: (nonnull NSString *) name;

/**
 Initializes a project with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return A newly created NKProject initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
