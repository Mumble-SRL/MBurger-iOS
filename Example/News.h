//
//  News.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 03/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface News : NSObject

@property NSString *title;
@property NSString *newsContent;
@property NSURL *imageUrl;

@property NSString *address;
@property double lat;
@property double lng;
@property NSNumber *coordinateLat;


@end
