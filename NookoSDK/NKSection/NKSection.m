//
//  NKSection.m
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

#import "NKSection.h"
#import "NKElementFactory.h"

#import <objc/runtime.h>

@implementation NKSection

- (instancetype) initWithSectionId: (NSInteger) sectionId Order: (NSInteger) order Elements: (NSDictionary *) elements AvailableAt: (NSDate *) availableAt{
    self = [super init];
    if (self){
        self.sectionId = sectionId;
        self.order = order;
        self.elements = elements;
        self.availableAt = availableAt;
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
    NSDate *availableAtDate = nil;
    if (dictionary[@"available_at"] != nil && dictionary[@"available_at"] != [NSNull null]){
        NSInteger availableAt = [dictionary[@"available_at"] integerValue];
        availableAtDate = [NSDate dateWithTimeIntervalSince1970:availableAt];
    }
    return [self initWithSectionId:sectionId Order:order Elements:elements AvailableAt:availableAtDate];
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
