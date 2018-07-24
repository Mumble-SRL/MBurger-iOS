//
//  MBGeofenceParameter.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MBParameter.h"

/**
 A parameter used to filter the elements retuned, the elements returned will be in the geofence square defined by the coordinates.
 */
@interface MBGeofenceParameter : NSObject <MBParameter>

/**
 The upper-right corner of the square specified in cooridinate.
 */
@property (nonatomic, assign) CLLocationCoordinate2D northEastCoordinate;

/**
 The lower-left corner of the square specified in cooridinate.
 */
@property (nonatomic, assign) CLLocationCoordinate2D southWestCoordinate;

/**
 Creates and initializes a geofence parameter object.
 
 @param northEastCoordinate The upper-right corner of the square specified in cooridinate.
 @param southWestCoordinate The lower-left corner of the square specified in cooridinate.
 
 @return A newly created MBGeofenceParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithNorthEastCoordinate: (CLLocationCoordinate2D) northEastCoordinate SouthWestCoordinate: (CLLocationCoordinate2D) southWestCoordinate;

/**
 Creates and initializes a geofence parameter object.
 
 @param northEastLatitude The latitude of the upper-right corner of the square.
 @param northEastLongitude The longitude of the upper-right corner of the square.
 @param southWestLatitude The latitude of the lower-left corner of the square.
 @param southWestLongitude The longitude of the lower-left corner of the square.

 @return A newly created MBGeofenceParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithNorthEastLatitude: (double) northEastLatitude
                        NorthEastLongitude: (double) northEastLongitude
                         SouthWestLatitude: (double) southWestLatitude
                        SouthWestLongitude: (double) southWestLongitude;

@end
