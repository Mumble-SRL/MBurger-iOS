//
//  MBBeacon.m
//  MBurger
//
//  Created by Alessandro Viviani on 11/06/21.
//  Copyright © 2021 Mumble. All rights reserved.
//

#import "MBBeacon.h"

@implementation MBBeacon

- (instancetype)initWithBeaconId:(NSInteger)beaconId Name:(NSString *)beaconName Subtitle:(NSString *)subtitle UUID:(NSString *)beaconUUID Major:(NSInteger)major Minor:(NSInteger)minor BeaconCode:(NSInteger)beaconCode {
    self = [super init];
    if (self){
        self.beaconId = beaconId;
        self.beaconName = beaconName;
        self.subtitle = subtitle;
        self.beaconUUID = beaconUUID;
        self.major = major;
        self.minor = minor;
        self.beaconCode = beaconCode;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    NSInteger beaconId = [dictionary[@"id"] integerValue];
    NSString *beaconName = dictionary[@"title"];
    NSString *subtitle = dictionary[@"subtitle"] != [NSNull null] ? dictionary[@"subtitle"] : nil;
    NSString *beaconUUID = dictionary[@"uuid"] != [NSNull null] ? dictionary[@"uuid"] : nil;
    NSInteger major = [dictionary[@"major"] integerValue];
    NSInteger minor = [dictionary[@"minor"] integerValue];
    NSInteger beaconCode = [dictionary[@"code"] integerValue];
    return [self initWithBeaconId:beaconId Name:beaconName Subtitle:subtitle UUID:beaconUUID Major:major Minor:minor BeaconCode:beaconCode];
}

@end
