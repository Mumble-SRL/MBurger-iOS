//
//  NKProject.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKProject.h"

@implementation NKProject

- (NKProject *) initWithProjectId: (NSInteger) projectId Name: (NSString *) name{
    self = [super init];
    if (self){
        self.projectId = projectId;
        self.projectName = name;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger projectId = [dictionary[@"id"] integerValue];
    NSString *projectName = dictionary[@"name"];
    return [self initWithProjectId:projectId Name:projectName];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[NKProject class]]){
        return [(NKProject *) object projectId] == self.projectId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.projectId = [aDecoder decodeIntegerForKey:@"projectId"];
        self.projectName = [aDecoder decodeObjectOfClass:NSString.class forKey:@"projectName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_projectId forKey:@"projectId"];
    [aCoder encodeObject:_projectName forKey:@"projectName"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
