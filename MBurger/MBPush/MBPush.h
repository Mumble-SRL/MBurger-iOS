//
//  MBPush.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Object used to manage all the push notifications handling
 */
@interface MBPush : NSObject

/**
 Registers the device with the push service. This is the first call that needs to be done.

 @param deviceData The token information retuned when the device is registered form the push notifications in `application:didRegisterForRemoteNotificationsWithDeviceToken:`
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) registerDeviceWithDeviceData: (nonnull NSData *) deviceData
                              Success: (nullable void (^)(void)) success
                              Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Register the current device to a topic. This functions calls `[MBPush registerToTopics:Success:Failure]` with an array of a single object.
 @param topic the topic that will be registered
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) registerToTopic: (nonnull NSString *) topic
                 Success: (nullable void (^)(void)) success
                 Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Register the current device to an array of topics.
 @param topics the topics that will be registered
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) registerToTopics: (nonnull NSArray <NSString *> *) topics
                  Success: (nullable void (^)(void)) success
                  Failure: (nullable void (^)(NSError * _Nonnull error)) failure;
/**
 Unregister the current device to a topic. This functions calls `[MBPush unregisterFromTopics:Success:Failure]` with an array of a single object.
 @param topic the topic that will be unregistered
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) unregisterFromTopic: (nonnull NSString *) topic
                     Success: (nullable void (^)(void)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Unregister the current device from an array of topics.
 @param topics the topics that will be unregistered
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) unregisterFromTopics: (nonnull NSArray <NSString *> *) topics
                      Success: (nullable void (^)(void)) success
                      Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Unregister the current device from allt he topics registered previously.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes one argument: the error describing the error that occurred.
 */
+ (void) unregisterFromAllTopicsWithSuccess: (nullable void (^)(void)) success
                                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end

