//
//  MBLegalContract.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 09/10/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents a Legal contract in MBurger.
 */
@interface MBLegalContract : NSObject

/**
 The id of the contract
 */
@property (nonatomic, assign) NSInteger contractId;

/**
 The name of the contract
 */
@property (nonatomic, retain, nonnull) NSString *contractName;

/**
 The link of the contract, if setted
 */
@property (nonatomic, retain, nullable) NSString *link;

/**
 The text of the contract
 */
@property (nonatomic, retain, nullable) NSString *text;

/**
 If the contract is active or not
 */
@property (nonatomic, assign) BOOL active;

/**
 The creation date of the contract
 */
@property (nonatomic, retain, nonnull) NSDate *creationDate;

/**
 The update date of the contract
 */
@property (nonatomic, retain, nonnull) NSDate *updateDate;

/**
 Initializes a contract with the data provided.
 
 @param contractId The id of the contract.
 @param contractName The name of the contract.
 @param link The link of the contract.
 @param text The text of the contract.
 @param active If the contract is active or not.
 @param creationDate The creation date of the contract.
 @param updateDate The update date of the contract.

 @return A newly created MBProject initialized with the projectId and name.
 */
- (nonnull instancetype) initWithContractId: (NSInteger) contractId ContractName: (nonnull NSString *) contractName Link: (nullable NSString *) link Text: (nullable NSString *) text Active: (BOOL) active CreationDate: (nonnull NSDate *) creationDate UpdateDate: (nonnull NSDate *) updateDate;

/**
 Initializes a contract with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return A newly created MBLegalContract initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end

