//
//  NKPollElement.h
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

#import "NKElement.h"

/**
 This class represents a Nooko poll element, the property ansers contains the answers the user can give to a the poll.
 */
@interface NKPollElement : NKElement <NSCoding, NSSecureCoding>

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
 @see `-[NKElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param answers The answers for the element.
 @param expirationDate The expiration date of the poll.
 @param results The results of the poll.
 @param answer My answer to the poll.

 @return A newly created NKPollElement initialized with the parameters passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Answers: (nullable NSArray <NSString *> *) answers ExpirationDate: (nullable NSDate *) expirationDate Results: (nullable NSArray <NSNumber *> *) results Answered: (BOOL) answered Answer: (NSInteger) answer;

@end
