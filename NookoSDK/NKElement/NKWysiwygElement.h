//
//  NKWysiwygElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko wysiwyg element.
 */
@interface NKWysiwygElement : NKElement <NSCoding, NSSecureCoding>

/**
 The value of the element. This is an HTML string with the text formatted in the dashboard. Use this string in to load HTML in WebView or to create an attributed string from the HTML with initWithData:options:documentAttributes:error:
 @see [NSAttributedString initWithData:options:documentAttributes:error:](https://developer.apple.com/documentation/foundation/nsattributedstring/1524613-initwithdata?language=objc)
 */
@property (nonatomic, retain, nullable) NSString *wysiwyg;

/**
 Initializes a wysiwyg element with an elementId, a name and its value.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param wysiwyg The wysiwyg HTML string.
 
 @return a newly created NKWysiwygElement initialized with the elementId, the name and the value passed.
 */
- (instancetype _Nonnull) initWithElementId: (NSInteger) elementId Name: (NSString * _Nonnull) name Order: (NSInteger) order Wysiwyg: (NSString * _Nullable) wysiwyg;

/**
 Creates and returns the attributed string representing the value, if the HTML can be parsed.
 
 @param error An in-out variable containing an encountered error, if any.
 
 @see [NSAttributedString initWithData:options:documentAttributes:error:](https://developer.apple.com/documentation/foundation/nsattributedstring/1524613-initwithdata?language=objc)
 */
- (NSAttributedString * _Nullable) attributedString: (NSError * _Nullable *_Nullable) error;

@end
