//
//  NKUtilities.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 25/06/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKUtilities.h"

@implementation NKUtilities

+ (NSString *) urlEncodeStringForString: (NSString *) string{
    NSMutableCharacterSet *allowedChars = NSCharacterSet.URLQueryAllowedCharacterSet.mutableCopy;
    [allowedChars removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
    return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedChars];
}

@end
