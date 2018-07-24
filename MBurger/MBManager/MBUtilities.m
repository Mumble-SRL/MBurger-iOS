//
//  MBUtilities.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBUtilities.h"

@implementation MBUtilities

+ (NSString *) urlEncodeStringForString: (NSString *) string {
    NSMutableCharacterSet *allowedChars = NSCharacterSet.URLQueryAllowedCharacterSet.mutableCopy;
    [allowedChars removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
    return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedChars];
}

@end
