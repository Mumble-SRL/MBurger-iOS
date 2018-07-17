//
//  NKDropdownElementOption.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 25/06/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKDropdownElementOption.h"

@implementation NKDropdownElementOption

- (instancetype) initWithKey: (NSString *) key Value: (NSString *) value{
    self = [super init];
    if (self) {
        self.key = key;
        self.value = value;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSString *key = dictionary[@"key"];
    NSString *value = dictionary[@"value"];
    return [self initWithKey:key Value:value];
}

@end
