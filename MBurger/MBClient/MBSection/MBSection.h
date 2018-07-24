//
//  MBSection.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKResponse.h"
#import "MBElement.h"

/**
 This class represents a Nooko section.
 */
@interface MBSection : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the section.
 */
@property (nonatomic, assign) NSInteger sectionId;

/**
 The order of the section.
 */
@property (nonatomic, assign) NSInteger order;

/**
 The elements of the section. The key of the dictionary is the name of the element, the value is an instance of a MBElement that represents the object.
 */
@property (nonatomic, retain, nullable) NSDictionary *elements;

/**
 The date the section is available.
*/
@property (nonatomic, retain, nullable) NSDate *availableAt;

/**
 Initializes a section with a sectionId and the elements returned by the api.
 
 @param sectionId The id of the section.
 @param order The id order the section.
 @param elements The elements of the section as returned by the REST api.
 @param availableAt The date the section is available.

 @return A newly created MBSection initialized with the sectionId and elements.
 */
- (nonnull instancetype) initWithSectionId: (NSInteger) sectionId Order: (NSInteger) order Elements: (nullable NSDictionary *) elements AvailableAt: (nullable NSDate *) availableAt;

/**
 Initializes a section with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return A newly created MBSection initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

#pragma mark - Object mapping

/**
 *  Copy a set of elements values from this Entry to a custom object. This is very useful if you want to initialize a custom object you created with the values of the elements of this section. The properties of elements can be queried with the dot notation, e.g. image.firstImage.url, if no property is queried the object mapped is the value of the element, for example if it's a MBTextElement it will map the string value.
 *
 *  @param object     The object that will be filled with this data.
 *  @param mapping    A dictionary with the mapping to fill the data of the object.
 *
 *  @return The mapped object mapped.
 */
- (id) mapElementsToObject: (NSObject *) object withMapping: (NSDictionary *) mapping;

@end
