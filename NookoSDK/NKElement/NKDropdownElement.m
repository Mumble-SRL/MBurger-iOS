//
//  NKDropdownElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKDropdownElement.h"

@implementation NKDropdownElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Options: (NSArray <NSString *> *) options SelectedOptions: (NSString *) selectedOption{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeDropDown];
    if (self){
        self.options = options;
        self.selectedOption = selectedOption;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSString *selectedOption = dictionary[@"value"];
    //TODO: options when returned by api
    return [self initWithElementId:elementId Name:name Order:order Options:nil SelectedOptions:selectedOption];
}

#pragma mark - Value

- (id) value {
    return @{@"selectedOption" : self.selectedOption,
             @"options" : self.options ? self.options : @[]};
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.options = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"options"];
        self.selectedOption = [aDecoder decodeObjectOfClass:NSString.class forKey:@"selectedOption"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_options forKey:@"options"];
    [aCoder encodeObject:_selectedOption forKey:@"selectedOption"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
