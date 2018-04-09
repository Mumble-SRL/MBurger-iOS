//
//  News.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 03/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property NSString *title;
@property NSString *content;
@property NSURL *imageUrl;
@property NSString *link;

@end
