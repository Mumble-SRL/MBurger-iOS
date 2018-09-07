//
//  MBElementsFactory.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBElement.h"

/**
 This class is used to create `MBElement` objects based on the api return
 */
@interface MBElementsFactory : NSObject

/**
 Returns a MBElement object based on the type specified in the dictionary.
 
 @param elementDictionary The dictionary returned by the api.
 
 @return A newly created MBElement initialized with the data of the dictionary, if the type field of the dictionary cannot be represented by the implemented type of the SDK this functions returns nil.
 */
+ (MBElement *) elementForDictionary: (NSDictionary *) elementDictionary;

@end
