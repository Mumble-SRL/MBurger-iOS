//
//  MBCheckboxElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBCheckboxElement.h"

@implementation MBCheckboxElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Checked: (BOOL) checked{
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeCheckbox];
    if (self){
        self.checked = checked;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    BOOL checked = [dictionary[@"value"] boolValue];
    return [self initWithElementId:elementId Name:name Order:order Checked:checked];
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
