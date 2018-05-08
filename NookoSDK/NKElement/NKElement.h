//
//  NKElement.h
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

/// The type of elements
typedef NS_ENUM(NSUInteger, NKElementType) {
    /// Used when the type of the element can't be defined
    NKElementTypeUndefined,
    /// A text element
    NKElementTypeText,
    /// An image element
    NKElementTypeImages,
    /// A general media element
    NKElementTypeMedia,
    /// A checkbox element
    NKElementTypeCheckbox,
    /// A wysiwyg element
    NKElementTypeWysiwyg,
    /// A date element
    NKElementTypeDate,
    /// An address element
    NKElementTypeAddress,
    /// A dropdown element
    NKElementTypeDropDown,
    /// A poll element
    NKElementTypePoll
};

/**
 This class represents the base class for all general Nooko elements. All the specialized elements are subclasses of this class.
 @note You should not use this class directly because it doesn't have the value property. If you want a genereal element use the `NKGeneralElement` class
 */
@interface NKElement : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the element.
 */
@property (nonatomic, assign) NSInteger elementId;

/**
 The name of the element.
 */
@property (nonatomic, retain, nonnull) NSString *name;

/**
 The order of the element.
 */
@property (nonatomic, assign) NSInteger order;

/**
 The type of the element.
 */
@property (nonatomic, assign) NKElementType elementType;

/**
 Initializes an element with an elementId, the name, and the type of the element.
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param elementType The type of the element.
 
 @return A newly created NKElement initialized with the elementId and type.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Type: (NKElementType) elementType;

/**
 Initializes an element with the dictionary returned by the api.
 
 @param dictionary The response from the api.

 @return A newly created NKElement initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

/**
 The value of the element.
 @return The value of the element, the class of the value depends on the type of element we are calling this function
 */
- (nullable id) value;

@end
