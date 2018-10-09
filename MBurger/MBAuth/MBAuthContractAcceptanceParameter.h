//
//  MBAuthContractAcceptanceParameter.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/10/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBParameter.h"

/**
 A parameter that can be passed to the apis that indicates if a legal contract has been accepted or not
 */
@interface MBAuthContractAcceptanceParameter : NSObject <MBParameter>

/**
 The id of the contract
 */
@property (nonatomic, assign) NSInteger contractId;

/**
 If the contract has been accepted or not
 */
@property (nonatomic, assign) BOOL accepted;

/**
 Initializes a parameter object with the contract id and the acceptance flag.

 @param contractId The id of the contract.
 @param accepted If the contract has been accepted or not.
 @return A newly created MBAuthContractAcceptanceParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithContractId: (NSInteger) contractId Accepted: (BOOL) accepted;

@end
