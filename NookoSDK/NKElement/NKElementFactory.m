//
//  NKElementFactory.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 06/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElementFactory.h"
#import "NKTextElement.h"
#import "NKImagesElement.h"
#import "NKMediaElement.h"
#import "NKCheckboxElement.h"
#import "NKWysiwygElement.h"
#import "NKDateElement.h"
#import "NKAddressElement.h"
#import "NKDropdownElement.h"
#import "NKGeneralElement.h"

@implementation NKElementFactory

+ (NKElement *) elementForDictionary: (NSDictionary *) elementDictionary {
    NSString *typeString = elementDictionary[@"type"];
    if ([typeString isEqualToString:@"text"] || [typeString isEqualToString:@"textarea"]){
        return [[NKTextElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"image"]){
        return [[NKImagesElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"media"]){
        return [[NKMediaElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"audio"] || [typeString isEqualToString:@"video"] || [typeString isEqualToString:@"file"] || [typeString isEqualToString:@"document"]){
        return [[NKMediaElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"checkbox"]){
        return [[NKCheckboxElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"wysiwyg"]){
        return [[NKWysiwygElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"datetime"]){
        return [[NKDateElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"address"]){
        return [[NKAddressElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"dropdown"]){
        return [[NKDropdownElement alloc] initWithDictionary:elementDictionary];
    }
    return [[NKGeneralElement alloc] initWithDictionary:elementDictionary];
}

@end
