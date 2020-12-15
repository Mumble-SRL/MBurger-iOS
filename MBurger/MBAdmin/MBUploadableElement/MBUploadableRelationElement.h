//
//  MBUploadableRelationElement.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 21/07/2020.
//  Copyright © 2020 Mumble. All rights reserved.
//

#import "MBUploadableElement.h"

/**
An uploadable element representing a relation.
When converted to form with `-[MBUploadableElement toForm]` is returned an array with objects with name `elements[name][index]` and value the section id.
*/
@interface MBUploadableRelationElement : MBUploadableElement

/**
 The section ids for this relation.
 */
@property (nonatomic, retain, nonnull) NSArray<NSNumber *> *sectionIds;

/**
 Initializes a relation element with the name, the locale and an array of section ids.
 @see This function calls the initializer `-[MBUploadableImagesElement initWithElementName:LocaleIdentifier:Images:CompressionQuality]`

 @param elementName The name/key of the element.
 @param localeIdentifier The locale of the element.
 @param sectionIds The section ids of the element.
 
 @return A newly created MBUploadableRelationElement initialized with the name, locale and section ids.
 */
- (nonnull instancetype) initWithElementName: (nonnull NSString *) elementName LocaleIdentifier: (nonnull NSString *) localeIdentifier SectionIds: (nonnull NSArray <NSNumber *> *) sectionIds;

@end
