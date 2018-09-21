//
//  MBManager.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBPlugin.h"

/**
 The manager of the SDK.
 */
@interface MBManager : NSObject

/**
Creates and returns a singleton `MBManager`.
Don't allocate an instance of MBManager yourself.
 */
+ (nonnull MBManager *) sharedManager;

/**
The API token used to make all the requests to the api.
 */
@property (readwrite, nonatomic, strong, nullable) NSString *apiToken;

/**
 The token used to make calls to the push service.
 */
@property (readwrite, nonatomic, strong, nullable) NSString *pushToken;

/**
 The locale used to make the requests.
 */
@property (readwrite, nonatomic, strong, nullable) NSLocale *locale;

/**
 An array of plugin objects that can add functionality to the core MBurger.
 */
@property (readwrite, nonatomic, strong, nullable) NSArray <id <MBPlugin>> *plugins;

/**
 It's true if it's in development mode
 */
@property (nonatomic, assign) BOOL development;

/**
 The locale string sended to the api.

 @return The locale string sended to the api.
 */
- (NSString *) localeString;

@end
