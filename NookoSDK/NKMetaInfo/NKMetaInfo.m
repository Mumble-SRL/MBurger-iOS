//
//  NKMetaInfo.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKMetaInfo.h"

@implementation NKMetaInfo

- (instancetype) initWithFrom: (NSInteger) from To: (NSInteger) to Count: (NSInteger) count{
    self = [super init];
    if (self){
        self.from = from;
        self.to = to;
        self.count = count;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger from = [dictionary[@"from"] integerValue];
    NSInteger to = [dictionary[@"to"] integerValue];
    NSInteger count = [dictionary[@"count"] integerValue];
    return [self initWithFrom:from To:to Count:count];
}

@end
