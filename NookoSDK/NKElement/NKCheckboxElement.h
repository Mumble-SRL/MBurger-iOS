//
//  NKCheckboxElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko checkbox element.
 */
@interface NKCheckboxElement : NKElement <NSCoding, NSSecureCoding>

/**
 If the checkbox element is checked or not.
 */
@property (nonatomic, assign) BOOL checked;

/**
 Initializes a checkbox element with an elementId, a name and its value.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param checked If the checkbox is checked.
 
 @return a newly created NKCheckboxElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Checked: (BOOL) checked;

@end
