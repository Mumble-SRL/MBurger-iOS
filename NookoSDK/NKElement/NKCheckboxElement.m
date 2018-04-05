//
//  NKCheckboxElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKCheckboxElement.h"

@implementation NKCheckboxElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Checked: (BOOL) checked{
    self = [super initWithElementId:elementId Name:name Type:NKElementTypeCheckbox];
    if (self){
        self.checked = checked;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    BOOL checked = [dictionary[@"value"] boolValue];
    return [self initWithElementId:elementId Name:name Checked:checked];
}

#pragma mark - Value

- (id) value {
    return [NSNumber numberWithBool: self.checked];
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.checked = [aDecoder decodeBoolForKey:@"checked"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeBool:_checked forKey:@"checked"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}


@end
