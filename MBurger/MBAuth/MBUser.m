//
//  MBUser.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. All rights reserved.
//

#import "MBUser.h"

@implementation MBUser

- (instancetype) initWithUserId: (NSInteger) userId
                           Name: (NSString *) name
                        Surname: (NSString *) surname
                          Email: (NSString *) email
                          Phone: (NSString *) phone
                       ImageURL: (NSURL *) imageURL
                      Contracts: (NSArray <MBUserContractStatus *> *) contracts
                           Data: (id) data{
    self = [super init];
    if (self){
        self.userId = userId;
        self.name = name;
        self.surname = surname;
        self.email = email;
        self.phone = phone;
        self.imageURL = imageURL;
        self.contracts = contracts;
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
    NSArray *contracts = nil;
    if (dictionary[@"contracts"] && dictionary[@"contracts"] != [NSNull null]){
        NSArray *contractsFromDictionary = dictionary[@"contracts"];
        NSMutableArray *mutableContracts = [[NSMutableArray alloc] init];
        for (NSDictionary *contractDictionary in contractsFromDictionary) {
            [mutableContracts addObject:[[MBUserContractStatus alloc] initWithDictionary:contractDictionary]];
        }
        contracts = mutableContracts;
    }
    id data = nil;
    if (dictionary[@"data"] && dictionary[@"data"] != [NSNull null]){
        data = dictionary[@"data"];
    }
    return [self initWithUserId:userId Name:name Surname:surname Email:email Phone:phone ImageURL:imageUrl Contracts:contracts Data:data];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[MBUser class]]){
        return [(MBUser *) object userId] == self.userId;
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
        self.contracts = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"contracts"];
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
    [aCoder encodeObject:_contracts forKey:@"contracts"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with id: %ld", NSStringFromClass(self.class), (long) self.userId];
}

@end
