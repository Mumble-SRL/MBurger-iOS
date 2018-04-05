//
//  NKPaginationParameter.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPaginationParameter.h"

@implementation NKPaginationParameter

- (instancetype) initWithSkip: (NSInteger) skip Take: (NSInteger) take{
    self = [super init];
    if (self){
        self.skip = skip;
        self.take = take;
    }
    return self;
}

- (NSDictionary *) parameterRepresentation {
    return [[NSDictionary alloc] initWithObjectsAndKeys:@(self.skip), @"skip", @(self.take), @"take", nil];
}

@end
