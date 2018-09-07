//
//  MBDropdownElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBDropdownElement.h"

@implementation MBDropdownElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Options: (NSArray <MBDropdownElementOption *> *) options SelectedOptions: (NSString *) selectedOption{
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeDropDown];
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
    NSMutableArray *options = [[NSMutableArray alloc] init];
    NSArray *optionsFromApi = dictionary[@"options"];
    for (NSDictionary *optionDictionary in optionsFromApi){
        [options addObject:[[MBDropdownElementOption alloc] initWithDictionary:optionDictionary]];
    }
    return [self initWithElementId:elementId Name:name Order:order Options:options SelectedOptions:selectedOption];
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
