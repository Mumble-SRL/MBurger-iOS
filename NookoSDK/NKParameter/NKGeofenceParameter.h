//
//  NKGeofenceParameter.h
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
 
 @return A newly created NKFilterParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithNorthEastCoordinate: (CLLocationCoordinate2D) northEastCoordinate SouthWestCoordinate: (CLLocationCoordinate2D) southWestCoordinate;

/**
 Creates and initializes a geofence parameter object.
 
 @param northEastLatitude The latitude of the upper-right corner of the square.
 @param northEastLongitude The longitude of the upper-right corner of the square.
 @param southWestLatitude The latitude of the lower-left corner of the square.
 @param southWestLongitude The longitude of the lower-left corner of the square.

 @return A newly created NKFilterParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithNorthEastLatitude: (double) northEastLatitude
                        NorthEastLongitude: (double) northEastLongitude
                         SouthWestLatitude: (double) southWestLatitude
                        SouthWestLongitude: (double) southWestLongitude;

@end
