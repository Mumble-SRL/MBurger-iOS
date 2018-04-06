//
//  NKBlock.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKSection.h"
#import "NKResponse.h"

/**
 This class represents a Nooko block.
 */
@interface NKBlock : NSObject <NSCoding, NSSecureCoding>

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
@property (nonatomic, retain, nullable) NSArray <NKSection *> *sections;

/**
 Initializes a block with a blockId and the sections returned by the api.
 
 @param blockId The id of the block.
 @param title The title of the block.
 @param order The order index of the block.
 @param sections The sections of the block.
 
 @return a newly created NKBlock initialized with the blockId and sections.
 */
- (instancetype _Nonnull) initWithBlockId: (NSInteger) blockId Title: (NSString *) title Subtitle: (NSString *) subtitle Order: (NSInteger) order Sections: (NSArray <NKSection *> * _Nullable) sections;

/**
 Initializes a block with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.

 @return a newly created NKBlock initialized with the data of the dictionary.
 */
- (instancetype _Nonnull) initWithDictionary: (NSDictionary * _Nonnull) dictionary;

@end
