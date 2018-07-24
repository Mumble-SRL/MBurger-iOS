//
//  MBCheckboxElement.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBElement.h"

/**
 This class represents a MBurger checkbox element.
 */
@interface MBCheckboxElement : MBElement <NSCoding, NSSecureCoding>

/**
 If the checkbox element is checked or not.
 */
@property (nonatomic, assign) BOOL checked;

/**
 Initializes a checkbox element with an elementId, a name and its value.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[MBElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param checked If the checkbox is checked.
 
 @return A newly created MBCheckboxElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Checked: (BOOL) checked;

@end
