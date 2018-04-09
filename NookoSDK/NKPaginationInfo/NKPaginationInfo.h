//
//  NKPaginationInfo.h
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

/**
 This class contains meta information abaut the pagination, it's usually returned when an array is requested by the api.
 */
@interface NKPaginationInfo : NSObject

/**
 The starting index.
 */
@property (nonatomic, assign) NSInteger from;

/**
 The ending index.
 */
@property (nonatomic, assign) NSInteger to;

/**
 The total number of elements of that type on Nooko.
 */
@property (nonatomic, assign) NSInteger total;

/**
 Initializes a meta info object with the properties.
 
 @param from The starting index.
 @param to The ending index.
 @param total The total number of elements of that type on Nooko.

 @return a newly created NKPaginationInfo initialized with the data passed.
 */
- (instancetype _Nonnull) initWithFrom: (NSInteger) from To: (NSInteger) to Total: (NSInteger) total;

/**
 Initializes a meta info object with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.
 
 @return a newly created NKPaginationInfo initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

@end
