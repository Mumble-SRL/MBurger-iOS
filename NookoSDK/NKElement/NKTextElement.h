//
//  NKTextElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko text element.
 It is the counterpart of the 'text' and 'textelement' types on the dashboard
 */
@interface NKTextElement : NKElement <NSCoding, NSSecureCoding>

/**
 The value of the element.
 */
@property (nonatomic, retain, nullable) NSString *text;

/**
 Initializes a text element with an elementId and its value.
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param text The text of the element.
 
 @return a newly created NKTextElement initialized with the elementId, the name and the value passed.
*/
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Text: (NSString * _Nullable) text;

@end
