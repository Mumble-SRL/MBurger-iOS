//
//  NKSortParameter.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKSortParameter.h"

@implementation NKSortParameter

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
