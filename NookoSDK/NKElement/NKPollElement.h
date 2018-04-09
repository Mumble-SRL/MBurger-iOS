//
//  NKPollElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 09/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko poll element, the property ansers contains the answers the user can give to a the poll.
 */
@interface NKPollElement : NKElement

/**
 The possible answes for the poll.
 */
@property (nonatomic, retain, nullable) NSArray <NSString *> *answers;

/**
 Initializes a poll element with an elementId, a name and the answers.
 This function calls the super initializer initWithElementId:Name:Type
 @see `-[NKElement initWithElementId:Name:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param answers The answers for the element.
 
 @return a newly created NKPollElement initialized with the parameters passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Answers: (NSArray <NSString *> * _Nullable) answers;

@end
