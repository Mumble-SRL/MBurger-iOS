//
//  NKDateElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKDateElement.h"

@implementation NKDateElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Date: (NSDate *) date{
    self = [super initWithElementId:elementId Name:name Type:NKElementTypeDate];
    if (self){
        self.date = date;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm";
    NSString *dateString = dictionary[@"value"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self initWithElementId:elementId Name:name Date:date];
}

#pragma mark - Value

- (id) value {
    return self.date;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.date = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"date"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_date forKey:@"date"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
