//
//  MBRelationElement.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 22/10/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBElement.h"
#import "MBRelationSection.h"

/**
This class represents a MBurger relation element, a relation between two sections.
*/
@interface MBRelationElement : MBElement <NSCoding, NSSecureCoding>

/**
 The sections related to this section.
 */
@property (nonatomic, retain, nonnull) NSArray<MBRelationSection *> *sections;

/**
 Initializes a relation element with an blockId and a sectionId.
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param sections The sections related to this section.

 @return A newly created MBRelationElement initialized with the elementId, the name and the blockid and section id passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Sections: (nonnull NSArray<MBRelationSection *> *) sections;

@end
