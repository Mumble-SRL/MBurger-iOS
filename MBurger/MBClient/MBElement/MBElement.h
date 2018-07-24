//
//  MBElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/// The type of elements
typedef NS_ENUM(NSUInteger, MBElementType) {
    /// Used when the type of the element can't be defined
    MBElementTypeUndefined,
    /// A text element
    MBElementTypeText,
    /// An image element
    MBElementTypeImages,
    /// A general media element
    MBElementTypeMedia,
    /// A checkbox element
    MBElementTypeCheckbox,
    /// A wysiwyg element
    MBElementTypeWysiwyg,
    /// A date element
    MBElementTypeDate,
    /// An address element
    MBElementTypeAddress,
    /// A dropdown element
    MBElementTypeDropDown,
    /// A poll element
    MBElementTypePoll
};

/**
 This class represents the base class for all general Nooko elements. All the specialized elements are subclasses of this class.
 @note You should not use this class directly because it doesn't have the value property. If you want a genereal element use the `MBGeneralElement` class
 */
@interface MBElement : NSObject <NSCoding, NSSecureCoding>

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
@property (nonatomic, assign) MBElementType elementType;

/**
 Initializes an element with an elementId, the name, and the type of the element.
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param elementType The type of the element.
 
 @return A newly created MBElement initialized with the elementId and type.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Type: (MBElementType) elementType;

/**
 Initializes an element with the dictionary returned by the api.
 
 @param dictionary The response from the api.

 @return A newly created MBElement initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

/**
 The value of the element.
 @return The value of the element, the class of the value depends on the type of element we are calling this function
 */
- (nullable id) value;

@end
