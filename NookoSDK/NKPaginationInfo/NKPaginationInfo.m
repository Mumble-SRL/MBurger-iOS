//
//  NKPaginationInfo.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPaginationInfo.h"

@implementation NKPaginationInfo

- (instancetype) initWithFrom: (NSInteger) from To: (NSInteger) to Total: (NSInteger) total{
    self = [super init];
    if (self){
        self.from = from;
        self.to = to;
        self.total = total;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger from = [dictionary[@"from"] integerValue];
    NSInteger to = [dictionary[@"to"] integerValue];
    NSInteger total = [dictionary[@"total"] integerValue];
    return [self initWithFrom:from To:to Total:total];
}

@end
