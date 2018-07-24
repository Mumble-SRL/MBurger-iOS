//
//  MBUtilities.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 An utility class.
 */
@interface MBUtilities : NSObject

/**
 Convert a string to a url encoded string

 @param string The string that has to be conveted.
 @return The converted string.
 */
+ (nonnull NSString *) urlEncodeStringForString: (nonnull NSString *) string;

@end
