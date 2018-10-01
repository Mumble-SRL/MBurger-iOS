//
//  MBDropdownElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"
#import "MBDropdownElementOption.h"

/**
 This class represents a MBurger dropdown element.
 */
@interface MBDropdownElement : MBElement <NSCoding, NSSecureCoding>

/**
 The possible options of the dropdown.
 */
@property (nonatomic, retain, nullable) NSArray <MBDropdownElementOption *> *options;

/**
 The selected option of the dropdown.
 */
@property (nonatomic, retain, nullable) NSString *selectedOption;

/**
 Initializes a dropdown element with an elementId, a name, the options and the selected options.
 This function calls the super initializer initWithElementId:Name:Type
 @see `-[MBElement initWithElementId:Name:Order:Type:]`
 
 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param options The options for the element.
 @param selectedOption The selected option.
 
 @return A newly created MBDropdownElement initialized with the parameters passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Options: (nullable NSArray <MBDropdownElementOption *> *) options SelectedOptions: (nullable NSString *) selectedOption;

@end
