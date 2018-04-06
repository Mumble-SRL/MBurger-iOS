//
//  NKElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
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
    NKElementTypeDropDown
};

/**
 This class represents the base class for all general Nooko elements. All the specialized elements are subclasses of this class.
 @note You should not use this class directly because it doesn't have the value property. If you want a genereal element use the NKGeneralElement class
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
 
 @return a newly created NKElement initialized with the elementId and type.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Type: (NKElementType) elementType;

/**
 Initializes an element with the dictionary returned by the api.
 
 @param dictionary The response from the api.

 @return a newly created NKElement initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

/**
 The value of the element.
 @return The value of the element, the class of the value depends on the type of element we are calling this function
 */
- (id _Nullable) value;

@end
