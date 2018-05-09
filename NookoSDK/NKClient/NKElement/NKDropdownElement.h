//
//  NKDropdownElement.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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
 @see `-[NKElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param options The options for the element.
 @param selectedOption The selected option.
 
 @return A newly created NKDropdownElement initialized with the parameters passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Options: (nullable NSArray <NSString *> *) options SelectedOptions: (NSString *) selectedOption;

@end
