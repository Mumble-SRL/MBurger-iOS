//
//  NKUser.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import "NKUser.h"

@implementation NKUser

- (instancetype) initWithUserId: (NSInteger) userId
                           Name: (NSString *) name
                        Surname: (NSString *) surname
                          Email: (NSString *) email
                          Phone: (NSString *) phone
                       ImageURL: (NSURL *) imageURL
                           Data: (id) data{
    self = [super init];
    if (self){
        self.userId = userId;
        self.name = name;
        self.surname = surname;
        self.email = email;
        self.phone = phone;
        self.imageURL = imageURL;
        self.data = data;
    }
    return self;
}

- (instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary{
    NSInteger userId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSString *surname = dictionary[@"surname"];
    NSString *email = dictionary[@"email"];
    NSString *phone = dictionary[@"phone"] != [NSNull null] ? dictionary[@"phone"] : nil;
    NSURL *imageUrl = dictionary[@"image"] != [NSNull null] ? [NSURL URLWithString: dictionary[@"image"]] : nil;
    id data = nil;
    if (dictionary[@"data"] && dictionary[@"data"] != [NSNull null]){
        data = dictionary[@"data"];
    }
    return [self initWithUserId:userId Name:name Surname:surname Email:email Phone:phone ImageURL:imageUrl Data:data];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[NKUser class]]){
        return [(NKUser *) object userId] == self.userId;
    }
    return NO;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.userId = [aDecoder decodeIntegerForKey:@"userId"];
        self.name = [aDecoder decodeObjectOfClass:NSString.class forKey:@"name"];
        self.surname = [aDecoder decodeObjectOfClass:NSString.class forKey:@"surname"];
        self.email = [aDecoder decodeObjectOfClass:NSString.class forKey:@"email"];
        self.phone = [aDecoder decodeObjectOfClass:NSString.class forKey:@"phone"];
        self.imageURL = [aDecoder decodeObjectOfClass:NSURL.class forKey:@"imageURL"];
        self.data = [aDecoder decodeObjectOfClass:NSString.class forKey:@"data"];
        self.pluginsObjects = [aDecoder decodeObjectOfClass:NSString.class forKey:@"pluginsObjects"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_userId forKey:@"userId"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_surname forKey:@"surname"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    [aCoder encodeObject:_imageURL forKey:@"imageURL"];
    [aCoder encodeObject:_data forKey:@"data"];
    [aCoder encodeObject:_pluginsObjects forKey:@"pluginsObjects"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with id: %ld", NSStringFromClass(self.class), (long) self.userId];
}

@end
