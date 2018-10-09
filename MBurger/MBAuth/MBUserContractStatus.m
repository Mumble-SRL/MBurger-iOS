//
//  MBUserContractStatus.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/10/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "MBUserContractStatus.h"

@implementation MBUserContractStatus

- (instancetype) initWithContractId: (NSInteger) contractId Accepted: (BOOL) accepted{
    self = [super init];
    if (self){
        self.contractId = contractId;
        self.accepted = accepted;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger contractId = [dictionary[@"id"] integerValue];
    BOOL accepted = [dictionary[@"accepted"] boolValue];
    return [self initWithContractId:contractId Accepted:accepted];
}

@end
