//
//  MBBlock.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBSection.h"
#import "NKResponse.h"

/**
 This class represents a Nooko block.
 */
@interface MBBlock : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the block.
 */
@property (nonatomic, assign) NSInteger blockId;

/**
 The title of the block.
 */
@property (nonatomic, retain, nonnull) NSString *title;

/**
 The subtitle of the block.
 */
@property (nonatomic, retain, nonnull) NSString *subtitle;

/**
 The order index of the block.
 */
@property (nonatomic, assign) NSInteger order;

/**
 The sections of the block.
 */
@property (nonatomic, retain, nullable) NSArray <MBSection *> *sections;

/**
 Initializes a block with a blockId and the sections returned by the api.
 
 @param blockId The id of the block.
 @param title The title of the block.
 @param order The order index of the block.
 @param sections The sections of the block.
 
 @return A newly created MBBlock initialized with the blockId and sections.
 */
- (nonnull instancetype) initWithBlockId: (NSInteger) blockId Title: (nonnull NSString *) title Subtitle: (nonnull NSString *) subtitle Order: (NSInteger) order Sections: (nullable NSArray <MBSection *> *) sections;

/**
 Initializes a block with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.

 @return A newly created MBBlock initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
