//
//  NKElementFactory.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKElement.h"

/**
 This class is used to create `NKElements` object based on the api return
 */
@interface NKElementFactory : NSObject

/**
 Returns a NKElement object based on the type specified in the dictionary.
 
 @param elementDictionary The dictionary returned by the api.
 
 @return A newly created NKElement initialized with the data of the dictionary, if the type field of the dictionary cannot be represented by the implemented type of the SDK this functions returns nil.
 */
+ (NKElement *) elementsForDictionary: (NSDictionary *) elementDictionary;

@end
