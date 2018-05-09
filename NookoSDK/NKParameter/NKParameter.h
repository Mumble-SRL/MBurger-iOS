//
//  NKParameter.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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
- (nonnull NSDictionary *) parameterRepresentation;

@end
