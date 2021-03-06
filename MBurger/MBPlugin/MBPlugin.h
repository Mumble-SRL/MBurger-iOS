//
//  MBPlugin.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBUser.h"

/**
 A plugin that can be attached to add more functionalities
 */
@protocol MBPlugin <NSObject>

@optional

/**
 Returns a object that will be inserted in the `pluginsObjects` property of the user

 @param userResponse The user from wich retrieve the data.
 @return The object to be inserted in the user.
 */
- (nonnull id <NSCoding, NSSecureCoding>) objectForUserResponse: (nonnull NSDictionary *) userResponse;


/**
 The key used in the user dictionary, used to retrieve and set the data.

 @return The key used in the user dictionary.
 */
- (nonnull NSString *) pluginUserKey;

@end
