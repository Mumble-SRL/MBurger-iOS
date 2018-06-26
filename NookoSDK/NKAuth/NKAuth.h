//
//  NKAuth.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NKUser.h"


/**
 Manages the authentication of the user.
 */
@interface NKAuth : NSObject

/**
 Register a user with the data provided

 @param name The name of the user.
 @param surname The surname of the user.
 @param email The email of the user.
 @param password The password that will be used to autheenticate the user.
 @param phone The phone of the user.
 @param image The image of the user.
 @param data Additional data passed with the registration, in json array format. You can include whatever you want in this parameter and it will be returned in the user profile.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) registerUserWithName: (nonnull NSString *) name
                      Surname: (nonnull NSString *) surname
                        Email: (nonnull NSString *) email
                     Password: (nonnull NSString *) password
                        Phone: (nullable NSString *) phone
                        Image: (nullable UIImage *) image
                         Data: (nullable NSString *) data
                      Success: (nullable void (^)(void)) success
                      Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


/**
 Authenticates a user giving the email and password.

 @param email The email of the user.
 @param password The password of the user.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the access token. The access token will be saved in the Keychain and will be used in all the subsequent calls to the Nooko apis.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) authenticateUserWithEmail: (nonnull NSString *) email
                          Password: (nonnull NSString *) password
                           Success: (nullable void (^)(NSString * _Nonnull accessToken)) success
                           Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


/**
 Change the password for the current authenticated user.

 @param oldPassword The old password of the user.
 @param newPassword The new password of the user.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) changePasswordForCurrentUserWithOldPassword: (nonnull NSString *) oldPassword
                                         NewPassword: (nonnull NSString *) newPassword
                                             Success: (nullable void (^)(void)) success
                                             Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Call this api if the user wants to reset its password. A mail will be sended to the user with a new password if a user with the given email is found in Nooko.

 @param email The email of the user.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) forgotPasswordWithEmail: (nonnull NSString *) email
                         Success: (nullable void (^)(void)) success
                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


/**
 Retrieves the profile informations of the current authenticated user.

 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the `NKUser` representing the logged user.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) getUserProfileWithSuccess: (nullable void (^)(NKUser * _Nonnull user)) success
                           Failure: (nullable void (^)(NSError * _Nonnull error)) failure;


/**
 Updates the profile informations of the current authenticated user.

 @param name The new name of the user.
 @param surname The new surname of the user.
 @param phone The new phone of the user.
 @param image The new image of the user.
 @param data The new data of the user.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the `NKUser` representing the new user.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) updateProfileWithName: (nonnull NSString *) name
                       Surname: (nonnull NSString *) surname
                         Phone: (nullable NSString *) phone
                         Image: (nullable UIImage *) image
                          Data: (nullable NSString *) data
                       Success: (nullable void (^)(NKUser * _Nonnull user)) success
                       Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Returns true if a user is authenticate. This funcion check if the access token saved in the keychain is non-null and different from an empty string.

 @return If a user is authenticate or not.
 */
+ (BOOL) userIsLoggedIn;

/**
 Logs out the current user removing his access token from the Keychain.
 */
+ (void) logoutCurrentUser;

/**
 The access token that represents the user, if an user has been authenticated correctly.

 @return The access token of the user.
 */
+ (nullable NSString *) authToken;

@end
