//
//  MBLegalContract.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/10/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "MBLegalContract.h"

@implementation MBLegalContract

- (instancetype) initWithContractId: (NSInteger) contractId ContractName: (NSString *) contractName Link: (NSString *) link Text: (NSString *) text Active: (BOOL) active CreationDate: (NSDate *) creationDate UpdateDate: (NSDate *) updateDate{
    self = [super init];
    if (self){
        self.contractId = contractId;
        self.contractName = contractName;
        self.link = link;
        self.text = text;
        self.active = active;
        self.creationDate = creationDate;
        self.updateDate = updateDate;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    NSInteger contractId = [dictionary[@"id"] integerValue];
    NSString *contractName = dictionary[@"name"];
    NSString *text = dictionary[@"text"] != [NSNull null] ? dictionary[@"text"] : nil;
    NSString *link = dictionary[@"link"] != [NSNull null] ? dictionary[@"link"] : nil;
    BOOL active = [dictionary[@"active"] boolValue];
    NSInteger creationTimeInterval = [dictionary[@"created_at"] floatValue];
    NSDate *creationDate = [NSDate dateWithTimeIntervalSince1970:creationTimeInterval];
    NSInteger updateTimeInterval = [dictionary[@"updated_at"] floatValue];
    NSDate *updateDate = [NSDate dateWithTimeIntervalSince1970:updateTimeInterval];
    return [self initWithContractId:contractId ContractName:contractName Link:link Text:text Active:active CreationDate:creationDate UpdateDate:updateDate];
}



@end
