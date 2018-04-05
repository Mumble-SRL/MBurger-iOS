//
//  NKGeofenceParameter.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "NKParameter.h"

/**
 A parameter used to filter the elements retuned, the elements returned will be in the geofence square defined by the coordinates.
 */
@interface NKGeofenceParameter : NSObject <NKParameter>

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
 
 @return a newly created NKFilterParameter initialized with the data passed.
 */
- (instancetype _Nonnull) initWithNorthEastCoordinate: (CLLocationCoordinate2D) northEastCoordinate SouthWestCoordinate: (CLLocationCoordinate2D) southWestCoordinate;

/**
 Creates and initializes a geofence parameter object.
 
 @param northEastLatitude The latitude of the upper-right corner of the square.
 @param northEastLongitude The longitude of the upper-right corner of the square.
 @param southWestLatitude The latitude of the lower-left corner of the square.
 @param southWestLongitude The longitude of the lower-left corner of the square.

 @return a newly created NKFilterParameter initialized with the data passed.
 */
- (instancetype _Nonnull) initWithNorthEastLatitude: (double) northEastLatitude
                        NorthEastLongitude: (double) northEastLongitude
                         SouthWestLatitude: (double) southWestLatitude
                        SouthWestLongitude: (double) southWestLongitude;

@end
