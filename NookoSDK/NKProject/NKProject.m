//
//  NKProject.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
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

@end
