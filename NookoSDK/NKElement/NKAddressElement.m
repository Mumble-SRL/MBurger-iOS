//
//  NKAddressElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKAddressElement.h"

@implementation NKAddressElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Address: (NSString *) address Latitude: (CLLocationDegrees) latitude Longitude: (CLLocationDegrees) longitude{
    return [self initWithElementId:elementId Name:name Address:address Coordinate:CLLocationCoordinate2DMake(latitude, longitude)];
}

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Address: (NSString *) address Coordinate: (CLLocationCoordinate2D) coordinate{
    self = [super initWithElementId:elementId Name:name Type:NKElementTypeAddress];
    if (self){
        self.address = address;
        self.coordinate = coordinate;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSDictionary *addressDictionary = dictionary[@"value"];
    NSString *address = addressDictionary[@"address"];
    double latitude = [addressDictionary[@"latitude"] doubleValue];
    double longitude = [addressDictionary[@"longitude"] doubleValue];
    return [self initWithElementId:elementId Name:name Address:address Latitude:latitude Longitude:longitude];
}

#pragma mark - Value

- (id) value {
    return @{@"address" : self.address,
             @"latitude" : @(self.coordinate.latitude),
             @"longitude" : @(self.coordinate.longitude)};
}

- (double) latitude {
    return self.coordinate.latitude;
}

- (double) longitude {
    return self.coordinate.longitude;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.address = [aDecoder decodeObjectOfClass:NSString.class forKey:@"address"];
        double latitude = [aDecoder decodeDoubleForKey:@"latitude"];
        double longitude = [aDecoder decodeDoubleForKey:@"longitude"];
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_address forKey:@"address"];
    [aCoder encodeDouble:self.coordinate.latitude forKey:@"latitude"];
    [aCoder encodeDouble:self.coordinate.longitude forKey:@"longitude"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
