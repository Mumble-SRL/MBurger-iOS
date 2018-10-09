//
//  MBAuthContractAcceptanceParameter.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/10/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "MBAuthContractAcceptanceParameter.h"

@implementation MBAuthContractAcceptanceParameter

- (instancetype) initWithContractId: (NSInteger) contractId Accepted: (BOOL) accepted{
    self = [super init];
    if (self){
        self.contractId = contractId;
        self.accepted = accepted;
    }
    return self;
}

- (NSDictionary *) dictionaryRepresentation{
    return @{@"id": @(self.contractId),
             @"accepted": self.accepted ? @(1) : @(0)};
}

@end
