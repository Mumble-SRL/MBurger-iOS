//
//  NKFilterParameter.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKFilterParameter.h"

@implementation NKFilterParameter

- (instancetype) initWithField: (NSString *) field Value: (NSString *) value{
    self = [super init];
    if (self){
        self.field = field;
        self.value = value;
    }
    return self;
}

- (NSDictionary *) parameterRepresentation {
    NSString *key = [NSString stringWithFormat:@"filter[%@]", self.field];
    return [[NSDictionary alloc] initWithObjectsAndKeys:self.value, key, nil];
}

@end
