//
//  NKManager.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKPlugin.h"

/**
 The manager of the SDK.
 */
@interface NKManager : NSObject

/**
Creates and returns a singleton `NKManager`.
Don't allocate an instance of NKManager yourself.
 */
+ (nonnull NKManager *) sharedManager;

/**
The API token used to make all the requests to the api.
 */
@property (readwrite, nonatomic, strong, nullable) NSString *apiToken;

/**
 The locale used to make the requests.
 */
@property (readwrite, nonatomic, strong, nullable) NSLocale *locale;

/**
 An array of plugin objects that can add functionality to the core Nooko.
 */
@property (readwrite, nonatomic, strong, nullable) NSArray <id <NKPlugin>> *plugins;

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
