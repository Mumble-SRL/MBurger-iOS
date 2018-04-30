//
//  NKSortParameter.h
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

#import <Foundation/Foundation.h>
#import "NKParameter.h"

/**
 A parameter used to sort the elements retuned.
 */
@interface NKSortParameter : NSObject <NKParameter>

/**
 The filed of the element used to sort.
 */
@property (nonatomic, retain, nonnull) NSString *field;

/**
 If the elements should be sorted in ascending order.
 */
@property (nonatomic, assign) BOOL ascending;

/**
 Creates and initializes a sort parameter object, the sorting will be ascending.
 
 @param field The filed of the element used to sort.

 @return a newly created NKSortParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field;

/**
 Creates and initializes a sort parameter object.
 
 @param field The filed of the element used to sort.
 @param ascending If the elements should be sorted in ascending order.
 
 @return a newly created NKSortParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithField: (nonnull NSString *) field Ascending: (BOOL) ascending;

@end
