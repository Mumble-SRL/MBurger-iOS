//
//  MBGeofenceParameter.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBGeofenceParameter.h"
#import "MBUtilities.h"

@implementation MBGeofenceParameter

- (instancetype) initWithNorthEastCoordinate: (CLLocationCoordinate2D) northEastCoordinate SouthWestCoordinate: (CLLocationCoordinate2D) southWestCoordinate {
    self = [super init];
    if (self){
        self.northEastCoordinate = northEastCoordinate;
        self.southWestCoordinate = southWestCoordinate;
    }
    return self;
}

- (instancetype) initWithNorthEastLatitude: (double) northEastLatitude
                        NorthEastLongitude: (double) northEastLongitude
                         SouthWestLatitude: (double) southWestLatitude
                        SouthWestLongitude: (double) southWestLongitude {
    return [self initWithNorthEastCoordinate:CLLocationCoordinate2DMake(northEastLatitude, northEastLongitude) SouthWestCoordinate:CLLocationCoordinate2DMake(southWestLatitude, southWestLongitude)];
}

- (NSDictionary *) parameterRepresentation {
    NSString *key = @"filter[elements.geofence]";
    NSString *value = [NSString stringWithFormat:@"%f,%f,%f,%f", self.northEastCoordinate.latitude, self.southWestCoordinate.latitude, self.northEastCoordinate.longitude, self.southWestCoordinate.longitude];
    return [[NSDictionary alloc] initWithObjectsAndKeys:value, [MBUtilities urlEncodeStringForString:key], nil];
}
@end
