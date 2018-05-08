//
//  NKBlock.m
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

#import "NKBlock.h"

@implementation NKBlock

- (NKBlock *) initWithBlockId: (NSInteger) blockId Title: (NSString *) title Subtitle: (NSString *) subtitle Order: (NSInteger) order Sections: (NSArray <NKSection *> *) sections{
    self = [super init];
    if (self){
        self.blockId = blockId;
        self.title = title;
        self.subtitle = subtitle;
        self.order = order;
        if (sections){
            self.sections = sections;
        }
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger blockId = [dictionary[@"id"] integerValue];
    NSString *blockTitle = dictionary[@"title"];
    NSString *blockSubtitle = dictionary[@"subtitle"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSArray *sections = nil;
    if (dictionary[@"sections"] != nil && dictionary[@"sections"] != [NSNull null]){
        NSArray *sectionsDictionaries = dictionary[@"sections"];
        NSMutableArray *sectionsMutable = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in sectionsDictionaries){
            [sectionsMutable addObject:[[NKSection alloc] initWithDictionary:dictionary]];
        }
        sections = sectionsMutable;
    }
    return [self initWithBlockId:blockId Title:blockTitle Subtitle:blockSubtitle Order:order Sections:sections];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[NKBlock class]]){
        return [(NKBlock *) object blockId] == self.blockId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.blockId = [aDecoder decodeIntegerForKey:@"blockId"];
        self.title = [aDecoder decodeObjectOfClass:NSString.class forKey:@"title"];
        self.subtitle = [aDecoder decodeObjectOfClass:NSString.class forKey:@"subtitle"];
        self.order = [aDecoder decodeIntegerForKey:@"order"];
        self.sections = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"sections"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_blockId forKey:@"blockId"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_subtitle forKey:@"subtitle"];
    [aCoder encodeInteger:_order forKey:@"order"];
    [aCoder encodeObject:_sections forKey:@"sections"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description

-(NSString *)description {
    return [NSString stringWithFormat:@"NKBlock with id: %ld", (long) self.blockId];
}

@end
