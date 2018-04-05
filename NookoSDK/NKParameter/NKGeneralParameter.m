//
//  NKGeneralParameter.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKGeneralParameter.h"

@implementation NKGeneralParameter

- (instancetype) initWithKey: (NSString *) key Value: (NSString *) value{
    self = [super init];
    if (self){
        self.key = key;
        self.value = value;
    }
    return self;
}

- (NSDictionary *) parameterRepresentation {
    return [[NSDictionary alloc] initWithObjectsAndKeys:self.value, self.key, nil];
}
@end
