//
//  MBElementsFactory.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElementsFactory.h"
#import "MBTextElement.h"
#import "MBImagesElement.h"
#import "MBMediaElement.h"
#import "MBCheckboxElement.h"
#import "MBWysiwygElement.h"
#import "MBDateElement.h"
#import "MBAddressElement.h"
#import "MBDropdownElement.h"
#import "MBPollElement.h"
#import "MBMarkdownElement.h"
#import "MBRelationElement.h"
#import "MBColorElement.h"
#import "MBGeneralElement.h"

@implementation MBElementsFactory

+ (MBElement *) elementForDictionary: (NSDictionary *) elementDictionary {
    NSString *typeString = elementDictionary[@"type"];
    if ([typeString isEqualToString:@"text"] || [typeString isEqualToString:@"textarea"]){
        return [[MBTextElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"image"]){
        return [[MBImagesElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"media"]){
        return [[MBMediaElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"audio"] || [typeString isEqualToString:@"video"] || [typeString isEqualToString:@"file"] || [typeString isEqualToString:@"document"]){
        return [[MBMediaElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"checkbox"]){
        return [[MBCheckboxElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"wysiwyg"]){
        return [[MBWysiwygElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"datetime"]){
        return [[MBDateElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"address"]){
        return [[MBAddressElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"dropdown"]){
        return [[MBDropdownElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"poll"]){
        return [[MBPollElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"markdown"]){
        return [[MBMarkdownElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"relation"]){
        return [[MBRelationElement alloc] initWithDictionary:elementDictionary];
    }
    else if ([typeString isEqualToString:@"color"]){
        return [[MBColorElement alloc] initWithDictionary:elementDictionary];
    }
    return [[MBGeneralElement alloc] initWithDictionary:elementDictionary];
}

@end
