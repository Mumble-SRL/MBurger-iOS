//
//  MBUser.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBUserContractStatus.h"
#import "MBUserPublishedSection.h"

/**
 An object representing the user informations.
 */
@interface MBUser : NSObject<NSCoding, NSSecureCoding>


/**
 The id of the user.
 */
@property (nonatomic, assign) NSInteger userId;


/**
 The name of the user.
 */
@property (nonatomic, retain, nonnull) NSString *name;


/**
 The surname of the user.
 */
@property (nonatomic, retain, nonnull) NSString *surname;


/**
 The email of the user. It is unique for every user in your project.
 */
@property (nonatomic, retain, nonnull) NSString *email;


/**
 The phone number of the user.
 */
@property (nonatomic, retain, nullable) NSString *phone;


/**
 The url of the profile image.
 */
@property (nonatomic, retain, nullable) NSURL *imageURL;


/**
 Additional data if passed when the user is registered.
 */
@property (nonatomic, retain, nullable) id data;

/**
 Dictionary of objects tha can be used by the plugins to add data to the user.
 */
@property (nonatomic, retain, nullable) NSDictionary *pluginsObjects;

/**
 An array of object representing the status of acceptance of the legal contracts of the project.
 */
@property (nonatomic, retain, nullable) NSArray <MBUserContractStatus *> *contracts;

/**
 An array of object representing all the sections published by the user.
*/
@property (nonatomic, retain, nullable) NSArray <MBUserPublishedSection *> *publishedSections;

/**
 Initializes a user with the parameters provided.

 @param userId The id of the user.
 @param name The name of the user.
 @param surname The surname of the user.
 @param email The email of the user.
 @param phone The phone number of the user.
 @param imageURL The url of the profile image.
 @param contracts An array of object representing the status of acceptance of the legal contracts of the project.
 @param publishedSections An array of object representing all the sections published by the user.
 @param data Additional data.
 @return A newly created MBUser initialized sith the parameters passed.
 */
- (nonnull instancetype) initWithUserId: (NSInteger) userId
                           Name: (nonnull NSString *) name
                        Surname: (nonnull NSString *) surname
                          Email: (nonnull NSString *) email
                          Phone: (nullable NSString *) phone
                       ImageURL: (nullable NSURL *) imageURL
                      Contracts: (nullable NSArray <MBUserContractStatus *> *) contracts
              PublishedSections: (nullable NSArray <MBUserPublishedSection *> *) publishedSections
                           Data: (nullable id) data;
/**
 Initializes a user with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return A newly created MBUser initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
