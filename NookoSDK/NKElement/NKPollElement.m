
//
//  NKPollElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 09/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPollElement.h"

@implementation NKPollElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Answers: (NSArray <NSString *> *) answers ExpirationDate: (NSDate * _Nullable) expirationDate Results: (NSArray <NSNumber *> * _Nullable) results{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypePoll];
    if (self){
        self.answers = answers;
        self.expirationDate = expirationDate;
        self.results = results;
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
    
    return [self initWithElementId:elementId Name:name Order:order Answers:answers ExpirationDate:expirationDate Results:results];
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
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_answers forKey:@"answers"];
    [aCoder encodeObject:_expirationDate forKey:@"expirationDate"];
    [aCoder encodeObject:_results forKey:@"results"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
