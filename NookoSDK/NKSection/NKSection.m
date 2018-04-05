//
//  NKSection.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKSection.h"
#import "NKTextElement.h"
#import "NKImagesElement.h"
#import "NKMediaElement.h"
#import "NKCheckboxElement.h"
#import "NKWysiwygElement.h"
#import "NKDateElement.h"
#import "NKAddressElement.h"
#import "NKDropdownElement.h"
#import "NKGeneralElement.h"

#import <objc/runtime.h>

@implementation NKSection

- (instancetype) initWithSectionId: (NSInteger) sectionId Elements: (NSDictionary *) elements{
    self = [super init];
    if (self){
        self.sectionId = sectionId;
        self.elements = elements;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger sectionId = [dictionary[@"id"] integerValue];
    NSDictionary *elements = nil;
    if (dictionary[@"elements"] != nil && dictionary[@"elements"] != [NSNull null]){
        NSDictionary *elementsDictionaryFromApi = dictionary[@"elements"];
        NSMutableDictionary *elementsMutable = [[NSMutableDictionary alloc] init];
        for (NSString *key in elementsDictionaryFromApi.allKeys){
            NSDictionary *objectDict = elementsDictionaryFromApi[key];
            NKElement *e = [self elementForDictionary:objectDict];
            if (e){
                elementsMutable[key] = e;
            }
        }
        if (elementsMutable.allKeys.count != 0){
            elements = elementsMutable;
        }
    }
    return [self initWithSectionId:sectionId Elements:elements];
}

/**
 Returns a NKElement object based on the tyoe of element specified in the dictionary.
 
 @param elementDictionary The dictionary returned by the api.
 
 @return a newly created NKElement initialized with the data of the dictionary, if the type field of the dictionary cannot be represented by the implemented type of the SDK this functions returns nil.
 */
- (NKElement *) elementForDictionary: (NSDictionary *) elementDictionary {
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

- (id) mapElementsToObject:(NSObject*)object withMapping:(NSDictionary*)mapping{
    [mapping enumerateKeysAndObjectsUsingBlock:^(NSString* selfKeyPath,
                                                 NSString* objectKeyPath, BOOL *stop) {
        NSArray *selfProperties = nil;
        if ([selfKeyPath containsString:@"."]){
            NSArray *components = [selfKeyPath componentsSeparatedByString:@"."];
            selfKeyPath = components.firstObject;
            if (components.count > 1){
                NSMutableArray *newComponents = [[NSMutableArray alloc] initWithArray: components];
                [newComponents removeObjectAtIndex:0];
                selfProperties = newComponents;
            }
        }
        id currentElement = [self.elements valueForKeyPath:selfKeyPath];
        if ([currentElement isKindOfClass:[NKElement class]]){
            NKElement *e = (NKElement *) currentElement;
            id value = [e value];
            if (selfProperties != nil){
                for (NSString *property in selfProperties){
                    value = [e valueForKey:property];
                }
            }
            //TODO: should i check something?
            [object setValue:value forKeyPath:objectKeyPath];
        }
    }];
    
    return object;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"NKSection with id: %ld", (long) self.sectionId];
}

@end
