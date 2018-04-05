//
//  NKSection.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKResponse.h"
#import "NKElement.h"

/**
 This class represents a Nooko section.
 */
@interface NKSection : NSObject

/**
 The id of the section.
 */
@property (nonatomic, assign) NSInteger sectionId;

/**
 The elements of the section. The key of the dictionary is the name of the element, the value is an instance of a NKElement that represents the object.
 */
@property (nonatomic, retain, nullable) NSDictionary *elements;

/**
 Initializes a section with a sectionId and the elements returned by the api.
 
 @param sectionId The id of the section.
 @param elements The elements of the section as returned by the REST api.
 
 @return a newly created NKSection initialized with the sectionId and elements.
 */
- (instancetype _Nonnull) initWithSectionId: (NSInteger) sectionId Elements: (NSDictionary * _Nullable) elements;

/**
 Initializes a section with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return a newly created NKSection initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

/**
 *  Copy a set of elements values from this Entry to a custom object. This is very useful if you want to initialize a custom object you created with the values of the elements of this section. If the mapping cannot be done because the two classes are incopatible it will be skipped
 *
 *  @param object     The object that will be filled with this data.
 *  @param mapping    A dictionary with the mapping to fill the data of the object.
 *
 *  @return The mapped object mapped.
 */
- (id) mapElementsToObject: (NSObject *) object withMapping: (NSDictionary *) mapping;

/**
 Returns a NKElement object based on the tyoe of element specified in the dictionary.
 
 @param elementDictionary The dictionary returned by the api.
 
 @return a newly created NKElement initialized with the data of the dictionary, if the type field of the dictionary cannot be represented by the implemented type of the SDK this functions returns a NKGeneralElement with the dictionary as the value.
 */
- (NKElement *) elementForDictionary: (NSDictionary *) elementDictionary;

@end
