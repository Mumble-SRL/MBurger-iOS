//
//  NKSection.h
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
#import "NKResponse.h"
#import "NKElement.h"

/**
 This class represents a Nooko section.
 */
@interface NKSection : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the section.
 */
@property (nonatomic, assign) NSInteger sectionId;

/**
 The order of the section.
 */
@property (nonatomic, assign) NSInteger order;

/**
 The elements of the section. The key of the dictionary is the name of the element, the value is an instance of a NKElement that represents the object.
 */
@property (nonatomic, retain, nullable) NSDictionary *elements;

/**
 Initializes a section with a sectionId and the elements returned by the api.
 
 @param sectionId The id of the section.
 @param order The id order the section.
 @param elements The elements of the section as returned by the REST api.
 
 @return a newly created NKSection initialized with the sectionId and elements.
 */
- (instancetype _Nonnull) initWithSectionId: (NSInteger) sectionId Order: (NSInteger) order Elements: (NSDictionary * _Nullable) elements;

/**
 Initializes a section with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return a newly created NKSection initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

/**
 *  Copy a set of elements values from this Entry to a custom object. This is very useful if you want to initialize a custom object you created with the values of the elements of this section. The properties of elements can be queried with the dot notation, e.g. image.firstImage.url, if no property is queried the object mapped is the value of the element, for example if it's a NKTextElement it will map the string value.
 *
 *  @param object     The object that will be filled with this data.
 *  @param mapping    A dictionary with the mapping to fill the data of the object.
 *
 *  @return The mapped object mapped.
 */
- (id) mapElementsToObject: (NSObject *) object withMapping: (NSDictionary *) mapping;

@end
