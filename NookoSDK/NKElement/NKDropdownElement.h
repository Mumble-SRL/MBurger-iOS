//
//  NKDropdownElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 04/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko dropdown element.
 */
@interface NKDropdownElement : NKElement <NSCoding, NSSecureCoding>

/**
 The possible options of the dropdown.
 */
@property (nonatomic, retain, nullable) NSArray <NSString *> *options;

/**
 The selected option of the dropdown.
 */
@property (nonatomic, retain, nullable) NSString *selectedOption;

/**
 Initializes a dropdown element with an elementId, a name, the options and the selected options.
 This function calls the super initializer initWithElementId:Name:Type
 @see `-[NKElement initWithElementId:Name:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param options The options for the element.
 @param selectedOption The selected option.
 
 @return a newly created NKDropdownElement initialized with the parameters passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Options: (NSArray <NSString *> * _Nullable) options SelectedOptions: (NSString *) selectedOption;

@end
