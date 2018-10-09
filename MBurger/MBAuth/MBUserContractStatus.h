//
//  MBUserContractStatus.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/10/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 An object indicating if a legal contract has been accepted by the user
 */
@interface MBUserContractStatus : NSObject

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

/**
 Initializes an object with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return A newly created MBUserContractStatus initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end

