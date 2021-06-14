//
//  MBBeacon.h
//  MBurger
//
//  Created by Alessandro Viviani on 11/06/21.
//  Copyright © 2021 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 This class represents a Beacon in MBurger.
 */
@interface MBBeacon : NSObject

/**
 The id of the contract
 */
@property (nonatomic, assign) NSInteger beaconId;

/**
 The name of the beacon
 */
@property (nonatomic, retain, nonnull) NSString *beaconName;

/**
 The subtitle of the beacon
 */
@property (nonatomic, retain, nullable) NSString *subtitle;

/**
 The UUID of the beacon, if setted
 */
@property (nonatomic, retain, nullable) NSString *beaconUUID;

/**
 The major code of the beacon
 */
@property (nonatomic, assign) NSInteger major;

/**
 The minor code of the beacon
 */
@property (nonatomic, assign) NSInteger minor;

/**
 The code associated to the beacon if the bluetooth doesn't work
 */
@property (nonatomic, assign) NSInteger beaconCode;

/**
 Initializes a contract with the data provided.
 
 @param beaconId The id of the beacon.
 @param beaconName The name of the beacon.
 @param subtitle The subtitle of the beacon.
 @param beaconUUID The UUID of the beacon.
 @param major The major code of the beacon.
 @param minor The minor code of the beacon.
 @param beaconCode The code associated to the beacon.

 @return A newly created MBBeacon initialized with the sectionId and name.
 */
- (nonnull instancetype) initWithBeaconId: (NSInteger) beaconId Name: (NSString *) beaconName Subtitle: (nullable NSString *) subtitle UUID: (nullable NSString *) beaconUUID Major: (NSInteger) major Minor: (NSInteger) minor BeaconCode: (NSInteger) beaconCode;

/**
 Initializes a contract with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return A newly created MBBeacon initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
