//
//  NKElementFactory.h
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
#import "NKElement.h"

/**
 This class is used to create `NKElements` object based on the api return
 */
@interface NKElementFactory : NSObject

/**
 Returns a NKElement object based on the type specified in the dictionary.
 
 @param elementDictionary The dictionary returned by the api.
 
 @return A newly created NKElement initialized with the data of the dictionary, if the type field of the dictionary cannot be represented by the implemented type of the SDK this functions returns nil.
 */
+ (NKElement *) elementsForDictionary: (NSDictionary *) elementDictionary;

@end
