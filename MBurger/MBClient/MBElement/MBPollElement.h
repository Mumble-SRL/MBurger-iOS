//
//  MBPollElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"

/**
 This class represents a Nooko poll element, the property ansers contains the answers the user can give to a the poll.
 */
@interface MBPollElement : MBElement <NSCoding, NSSecureCoding>

/**
 The possible answers for the poll.
 */
@property (nonatomic, retain, nullable) NSArray <NSString *> *answers;

/**
 The expiration date of the poll.
 */
@property (nonatomic, retain, nullable) NSDate *expirationDate;

/**
 The results of the poll.
 */
@property (nonatomic, retain, nullable) NSArray <NSNumber *> *results;

/**
 If I have answered.
 */
@property (nonatomic, assign) BOOL answered;

/**
 My answer to the poll, this value is determined by the device id sended with the api.
 If I haven't answered yet this poll, this variable will have value -1
 */
@property (nonatomic, assign) NSInteger answer;

/**
 Initializes a poll element with an elementId, a name and the answers.
 This function calls the super initializer initWithElementId:Name:Type
 @see `-[MBElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param answers The answers for the element.
 @param expirationDate The expiration date of the poll.
 @param results The results of the poll.
 @param answer My answer to the poll.

 @return A newly created MBPollElement initialized with the parameters passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Answers: (nullable NSArray <NSString *> *) answers ExpirationDate: (nullable NSDate *) expirationDate Results: (nullable NSArray <NSNumber *> *) results Answered: (BOOL) answered Answer: (NSInteger) answer;

@end
