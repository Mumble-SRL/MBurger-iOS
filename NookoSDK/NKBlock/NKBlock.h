//
//  NKBlock.h
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
 
 @return A newly created NKBlock initialized with the blockId and sections.
 */
- (nonnull instancetype) initWithBlockId: (NSInteger) blockId Title: (nonnull NSString *) title Subtitle: (nonnull NSString *) subtitle Order: (NSInteger) order Sections: (nullable NSArray <NKSection *> *) sections;

/**
 Initializes a block with the dictionary returned by the api.
 
 @param dictionary The dictionary returned by the api.

 @return A newly created NKBlock initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
