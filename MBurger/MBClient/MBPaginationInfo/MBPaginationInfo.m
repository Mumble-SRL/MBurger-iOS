//
//  MBPaginationInfo.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPaginationInfo.h"

@implementation MBPaginationInfo

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
