//
//  NKSection.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKSection.h"
#import "NKElementFactory.h"

#import <objc/runtime.h>

@implementation NKSection

- (instancetype) initWithSectionId: (NSInteger) sectionId Order: (NSInteger) order Elements: (NSDictionary *) elements{
    self = [super init];
    if (self){
        self.sectionId = sectionId;
        self.order = order;
        self.elements = elements;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger sectionId = [dictionary[@"id"] integerValue];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSDictionary *elements = nil;
    if (dictionary[@"elements"] != nil && dictionary[@"elements"] != [NSNull null]){
        NSDictionary *elementsDictionaryFromApi = dictionary[@"elements"];
        NSMutableDictionary *elementsMutable = [[NSMutableDictionary alloc] init];
        for (NSString *key in elementsDictionaryFromApi.allKeys){
            NSDictionary *objectDict = elementsDictionaryFromApi[key];
            NKElement *e = [NKElementFactory elementsForDictionary:objectDict];
            if (e){
                elementsMutable[key] = e;
            }
        }
        if (elementsMutable.allKeys.count != 0){
            elements = elementsMutable;
        }
    }
    return [self initWithSectionId:sectionId Order:order Elements:elements];
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
            id value;
            if (selfProperties != nil){
                value = e;
                for (NSString *property in selfProperties){
                    value = [value valueForKey:property];
                }
            }
            else {
                value = [e value];
            }
            //TODO: should i check something?
            [object setValue:value forKeyPath:objectKeyPath];
        }
    }];
    
    return object;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[NKSection class]]){
        return [(NKSection *) object sectionId] == self.sectionId;
    }
    return FALSE;
}


#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.sectionId = [aDecoder decodeIntegerForKey:@"sectionId"];
        self.order = [aDecoder decodeIntegerForKey:@"order"];
        self.elements = [aDecoder decodeObjectOfClass:NSDictionary.class forKey:@"elements"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_sectionId forKey:@"sectionId"];
    [aCoder encodeInteger:_order forKey:@"order"];
    [aCoder encodeObject:_elements forKey:@"elements"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"NKSection with id: %ld", (long) self.sectionId];
}

@end
