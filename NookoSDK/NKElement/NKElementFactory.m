//
//  NKElementFactory.m
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
#import "NKPollElement.h"
#import "NKGeneralElement.h"

@implementation NKElementFactory

+ (NKElement *) elementsForDictionary: (NSDictionary *) elementDictionary {
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
    else if ([typeString isEqualToString:@"poll"]){
        return [[NKPollElement alloc] initWithDictionary:elementDictionary];
    }
    return [[NKGeneralElement alloc] initWithDictionary:elementDictionary];
}

@end
