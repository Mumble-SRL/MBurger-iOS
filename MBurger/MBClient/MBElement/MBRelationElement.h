//
//  MBRelationElement.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 22/10/2019.
//  Copyright © 2019 Mumble. All rights reserved.
//

#import "MBElement.h"

/**
This class represents a MBurger relation element, a relation between two sections.
*/
@interface MBRelationElement : MBElement <NSCoding, NSSecureCoding>

/**
 The block id of the section related to this section.
 */
@property (nonatomic, assign) NSInteger blockId;

/**
 The section id of the section related to this section.
 */
@property (nonatomic, assign) NSInteger sectionId;

/**
 Initializes a relation element with an blockId and a sectionId.
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param blockId The block id of the section related to this section.
 @param sectionId The section id of the section related to this section.

 @return A newly created MBRelationElement initialized with the elementId, the name and the blockid and section id passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order BlockId: (NSInteger) blockId SectionId: (NSInteger) sectionId;

@end
