//
//  NKAddressElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"
#import <CoreLocation/CoreLocation.h>

/**
 This class represents a Nooko address element.
 */
@interface NKAddressElement : NKElement <NSCoding, NSSecureCoding>

/**
 The value of the element.
 */
@property (nonatomic, retain, nullable) NSString *address;

/**
 The coordinate of the address.
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

/**
 Initializes a address element with an elementId, a name, its address and coordinate specified in latitude and lonigtude.
 This function calls the super initializer initWithElementId:Name:Type
 @see `-[NKElement initWithElementId:Name:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param address The address of the element.
 @param latitude The latitude.
 @param longitude The longitude.

 @return a newly created NKAddressElement initialized with the parameters passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Address: (NSString * _Nullable) address Latitude: (CLLocationDegrees) latitude Longitude: (CLLocationDegrees) longitude;

/**
 Initializes a address element with an elementId, a name, its address and coordinate as CLLocationCoordinate2D.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param address The address of the element.
 @param coordinate The coordinate.
 
 @return a newly created NKAddressElement initialized with the parameters passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Address: (NSString * _Nullable) address Coordinate: (CLLocationCoordinate2D) coordinate;

/**
 The latitude of the address if exists. If it dowsn't exists it returns 0
 @return The latitude of the address.
 */
- (double) latitude;

/**
 The longitude of the address if exists. If it dowsn't exists it returns 0
 @return The longitude of the address.
 */
- (double) longitude;

@end
