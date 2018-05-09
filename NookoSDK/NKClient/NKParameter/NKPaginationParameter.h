//
//  NKPaginationParameter.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKParameter.h"

/**
 A parameter used to paginate the elements retuned.
 */
@interface NKPaginationParameter : NSObject <NKParameter>

/**
 The number of elements to skip.
 */
@property (nonatomic, assign) NSInteger skip;

/**
 The number of elements to take.
 */
@property (nonatomic, assign) NSInteger take;

/**
 Creates and initializes a pagination parameter object.
 
 @param skip The number of elements to skip.
 @param take The number of elements to take.
 
 @return A newly created NKPaginationParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithSkip: (NSInteger) skip Take: (NSInteger) take;

@end
