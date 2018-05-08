//
//  NKProject.m
//  NookoSDK
//
//  Copyright (c) 2018 Mumble s.r.l. (https://mumbleideas.it/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
