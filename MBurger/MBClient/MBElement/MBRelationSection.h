//
//  MBRelationSection.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 14/12/20.
//

#import <Foundation/Foundation.h>

/// A section for a relation element
@interface MBRelationSection : NSObject<NSCoding, NSSecureCoding>

/**
 The block id of the section.
 */
@property (nonatomic, assign) NSInteger blockId;

/**
 The section id of the section.
 */
@property (nonatomic, assign) NSInteger sectionId;

/**
 Initializes a relation section with the dictionary returned by the API.
 
 @param dictionary The id of the dictionary returned by the API.

 @return A newly created MBRelationSection initialized with the dictionary returned by the API.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
