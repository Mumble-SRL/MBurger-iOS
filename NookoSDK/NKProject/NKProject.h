//
//  NKProject.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
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
 
 @return a newly created NKProject initialized with the projectId and name.
 */
- (instancetype _Nonnull) initWithProjectId: (NSInteger) projectId Name: (NSString * _Nonnull) name;

/**
 Initializes a project with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return a newly created NKProject initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

@end
