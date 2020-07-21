//
//  MBUploadableRelationElement.m
//  MBurger
//
//  Created by Lorenzo Oliveto on 21/07/2020.
//  Copyright © 2020 Mumble. All rights reserved.
//

#import "MBUploadableRelationElement.h"

@implementation MBUploadableRelationElement

- (nonnull instancetype) initWithElementName: (NSString *) elementName LocaleIdentifier: (NSString *) localeIdentifier SectionIds: (NSArray <NSNumber *> *) sectionIds {
    self = [super initWithElementName:elementName LocaleIdentifier:localeIdentifier];
    if (self){
        self.sectionIds = sectionIds;
    }
    return self;
}

- (NSArray <MBMultipartForm *> *) toForm {
    NSMutableArray *form = [[NSMutableArray alloc] init];
    [self.sectionIds enumerateObjectsUsingBlock:^(NSNumber *sectionId, NSUInteger idx, BOOL *stop) {
        [form addObject:[[MBMultipartForm alloc] initWithName:[self parameterNameForIndex:idx] Data:[sectionId.stringValue dataUsingEncoding:NSUTF8StringEncoding]]];
    }];
    return form;;
}

- (NSString *) parameterNameForIndex: (NSInteger) index {
    return [NSString stringWithFormat:@"elements[%@][%ld]", self.elementName,  (long) index];
}

@end
