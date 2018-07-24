//
//  MBGeneralParameter.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBGeneralParameter.h"

@implementation MBGeneralParameter

- (instancetype) initWithKey: (NSString *) key Value: (NSString *) value {
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
