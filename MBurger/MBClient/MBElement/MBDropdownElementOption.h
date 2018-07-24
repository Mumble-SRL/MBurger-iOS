//
//  MBDropdownElementOption.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents an option that can be selected in a dropdown.
 */
@interface MBDropdownElementOption : NSObject

/**
 The key of the option.
 */
@property (nonatomic, retain, nonnull) NSString *key;

/**
 The value of the option.
 */
@property (nonatomic, retain, nonnull) NSString *value;

/**
 Initializes a dropdown element option with a key and a value.
 
 @param key The key of the option.
 @param value The value of the option.
 
 @return A newly created MBDropdownElementOption initialized with the parameters passed.
 */
- (nonnull instancetype) initWithKey: (nonnull NSString *) key Value: (nonnull NSString *) value;

/**
 Initializes an element with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 
 @return A newly created MBDropdownElementOption initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
