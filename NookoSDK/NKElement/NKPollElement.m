
//
//  NKPollElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 09/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPollElement.h"

@implementation NKPollElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Answers: (NSArray <NSString *> *) answers{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeDropDown];
    if (self){
        self.answers = answers;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSArray *answers = dictionary[@"answes"];
    return [self initWithElementId:elementId Name:name Order:order Answers:answers];
}

#pragma mark - Value

- (id) value {
    return self.answers;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.answers = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"answers"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_answers forKey:@"answers"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
