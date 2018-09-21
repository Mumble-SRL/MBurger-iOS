//
//  MBHTTPMethod.h
//  MBurger
//
//  Created by Lorenzo Oliveto on 21/09/2018.
//  Copyright © 2018 Mumble. All rights reserved.
//

#ifndef MBHTTPMethod_h
#define MBHTTPMethod_h

/// The type of Http methods accepted
typedef NS_ENUM(NSUInteger, MBHTTPMethod) {
    /// Get method
    MBHTTPMethodGet,
    /// Post method
    MBHTTPMethodPost,
    /// Patch method
    MBHTTPMethodPatch,
    /// Put method
    MBHTTPMethodPut,
    /// Delete method
    MBHTTPMethodDelete,
};

#endif /* MBHTTPMethod_h */
