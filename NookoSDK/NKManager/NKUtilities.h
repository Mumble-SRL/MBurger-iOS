//
//  NKUtilities.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 25/06/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 An utility class.
 */
@interface NKUtilities : NSObject

/**
 Convert a string to a url encoded string

 @param string The string that has to be conveted.
 @return The converted string.
 */
+ (nonnull NSString *) urlEncodeStringForString: (nonnull NSString *) string;

@end
