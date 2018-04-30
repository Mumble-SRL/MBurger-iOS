//
//  NKGeneralParameter.h
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
 A general parameter passed to the Nooko Api.
 */
@interface NKGeneralParameter : NSObject <NKParameter>

/**
 The key of the parameter.
 */
@property (nonatomic, retain, nonnull) NSString *key;

/**
 The value of the parameter.
 */
@property (nonatomic, retain, nonnull) NSString *value;

/**
 Creates and initializes a parameter object.
 
 @param key The key of the parameter.
 @param value The value of the parameter.
 
 @return a newly created NKGeneralParameter initialized with the data passed.
 */
- (nonnull instancetype) initWithKey: (nonnull NSString *) key Value: (nonnull NSString *) value;

@end
