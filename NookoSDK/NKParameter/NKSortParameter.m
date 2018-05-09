//
//  NKSortParameter.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKSortParameter.h"

@implementation NKSortParameter

- (instancetype) initWithField: (NSString *) field{
    return [self initWithField:field Ascending:true];
}

- (instancetype) initWithField: (NSString *) field Ascending: (BOOL) ascending{
    self = [super init];
    if (self){
        self.field = field;
        self.ascending = self.ascending;
    }
    return self;
}

- (NSDictionary *) parameterRepresentation {
    NSString *value = self.ascending ? self.field : [NSString stringWithFormat:@"-%@", self.field];
    return [[NSDictionary alloc] initWithObjectsAndKeys:value, @"sort", nil];
}

@end
