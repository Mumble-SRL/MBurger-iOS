//
//  NKUploadableElement.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 07/05/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKMultipartForm.h"

@interface NKUploadableElement : NSObject

@property (nonatomic, retain, nullable) NSString *localeIdentifier;
@property (nonatomic, retain, nonnull) NSString *elementName;

- (instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier;

- (NSString *) parameterName;

- (NKMultipartForm *) toForm;

@end
