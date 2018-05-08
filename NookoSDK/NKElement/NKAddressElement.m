//
//  NKAddressElement.m
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

#import "NKAddressElement.h"

@implementation NKAddressElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Address: (NSString *) address Latitude: (CLLocationDegrees) latitude Longitude: (CLLocationDegrees) longitude{
    return [self initWithElementId:elementId Name:name Order:order Address:address Coordinate:CLLocationCoordinate2DMake(latitude, longitude)];
}

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Address: (NSString *) address Coordinate: (CLLocationCoordinate2D) coordinate{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeAddress];
    if (self){
        self.address = address;
        self.coordinate = coordinate;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSDictionary *addressDictionary = dictionary[@"value"];
    NSString *address = addressDictionary[@"address"];
    double latitude = [addressDictionary[@"latitude"] doubleValue];
    double longitude = [addressDictionary[@"longitude"] doubleValue];
    return [self initWithElementId:elementId Name:name Order:order Address:address Latitude:latitude Longitude:longitude];
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
