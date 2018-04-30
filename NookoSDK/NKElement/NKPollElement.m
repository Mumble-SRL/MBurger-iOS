
//
//  NKPollElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 09/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPollElement.h"

@implementation NKPollElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Answers: (NSArray <NSString *> *) answers ExpirationDate: (NSDate *) expirationDate Results: (NSArray <NSNumber *> *) results Answered: (BOOL) answered Answer: (NSInteger) answer{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypePoll];
    if (self){
        self.answers = answers;
        self.expirationDate = expirationDate;
        self.results = results;
        self.answered = answered;
        self.answer = answer;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSDictionary *valueDictionary = dictionary[@"value"];
    NSArray *answersFromApi = valueDictionary[@"answers"];
    NSMutableArray *answers = [[NSMutableArray alloc] init];
    for (id answer in answersFromApi){
        if (answer != [NSNull null]){
            [answers addObject:answer];
        }
    }
    
    NSDate *expirationDate = [NSDate dateWithTimeIntervalSince1970: [valueDictionary[@"ends_at"] integerValue]];
    NSArray *resultsFromApi = valueDictionary[@"results"];
    NSMutableArray *results = [[NSMutableArray alloc] initWithArray:resultsFromApi];
    while (results.count != answersFromApi.count) {
        [results removeLastObject];
    }
    
    NSInteger myAnswer = -1;
    if (valueDictionary[@"answer"] && valueDictionary[@"answer"] != [NSNull null]){
        myAnswer = [valueDictionary[@"answer"] integerValue];
    }
    BOOL answered = FALSE;
    if (valueDictionary[@"answered"] && valueDictionary[@"answered"] != [NSNull null]){
        answered = [valueDictionary[@"answered"] boolValue];
    }

    return [self initWithElementId:elementId Name:name Order:order Answers:answers ExpirationDate:expirationDate Results:results Answered:answered Answer:myAnswer];
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
        self.expirationDate = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"expirationDate"];
        self.results = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"results"];
        self.answered = [aDecoder decodeBoolForKey:@"answered"];
        self.answer = [aDecoder decodeIntegerForKey:@"answer"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_answers forKey:@"answers"];
    [aCoder encodeObject:_expirationDate forKey:@"expirationDate"];
    [aCoder encodeObject:_results forKey:@"results"];
    [aCoder encodeBool:_answered forKey:@"answered"];
    [aCoder encodeInteger:_answer forKey:@"sanswer"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
