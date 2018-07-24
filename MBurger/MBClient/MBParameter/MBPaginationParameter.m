//
//  MBPaginationParameter.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPaginationParameter.h"

@implementation MBPaginationParameter

- (instancetype) initWithSkip: (NSInteger) skip Take: (NSInteger) take {
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
