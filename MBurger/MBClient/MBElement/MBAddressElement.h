//
//  MBAddressElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"
#import <CoreLocation/CoreLocation.h>

/**
 This class represents a Nooko address element.
 */
@interface MBAddressElement : MBElement <NSCoding, NSSecureCoding>

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
 @see `-[MBElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param address The address of the element.
 @param latitude The latitude.
 @param longitude The longitude.

 @return A newly created MBAddressElement initialized with the parameters passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Address: (nullable NSString *) address Latitude: (CLLocationDegrees) latitude Longitude: (CLLocationDegrees) longitude;

/**
 Initializes a address element with an elementId, a name, its address and coordinate as CLLocationCoordinate2D.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param address The address of the element.
 @param coordinate The coordinate.
 
 @return A newly created MBAddressElement initialized with the parameters passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Address: (nullable NSString *) address Coordinate: (CLLocationCoordinate2D) coordinate;

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
