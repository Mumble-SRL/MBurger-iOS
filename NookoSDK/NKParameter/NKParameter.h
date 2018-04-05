//
//  NKParameter.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 05/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This protocol represent a parameter passed to the nooko api.
 */
@protocol NKParameter <NSObject>

/**
 A dictionary of elements that represents the parameter.
 The keys and values of the dictionary are the one passed as parameters to the Nooko api.
 */
- (NSDictionary * _Nonnull) parameterRepresentation;

@end
