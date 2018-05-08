//
//  NKGeofenceParameter.m
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

#import "NKGeofenceParameter.h"

@implementation NKGeofenceParameter

- (instancetype) initWithNorthEastCoordinate: (CLLocationCoordinate2D) northEastCoordinate SouthWestCoordinate: (CLLocationCoordinate2D) southWestCoordinate{
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
                        SouthWestLongitude: (double) southWestLongitude{
    return [self initWithNorthEastCoordinate:CLLocationCoordinate2DMake(northEastLatitude, northEastLongitude) SouthWestCoordinate:CLLocationCoordinate2DMake(southWestLatitude, southWestLongitude)];
}

- (NSDictionary *) parameterRepresentation {
    NSString *key = @"filter[elements.geofence]";
    NSString *value = [NSString stringWithFormat:@"%f,%f,%f,%f", self.northEastCoordinate.latitude, self.southWestCoordinate.latitude, self.northEastCoordinate.longitude, self.southWestCoordinate.longitude];
    return [[NSDictionary alloc] initWithObjectsAndKeys:value, key, nil];
}
@end
