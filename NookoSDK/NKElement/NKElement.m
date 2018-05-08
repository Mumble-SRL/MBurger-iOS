//
//  NKElement.m
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

#import "NKElement.h"

@implementation NKElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Type: (NKElementType) elementType{
    self = [super init];
    if (self){
        self.elementId = elementId;
        self.name = name;
        self.order = order;
        self.elementType = elementType;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NKElementType elementType = NKElementTypeUndefined;
    return [self initWithElementId:elementId Name:name Order:order Type:elementType];
}

- (id) value{
    return nil;
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[NKElement class]]){
        return [(NKElement *) object elementId] == self.elementId;
    }
    return FALSE;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.elementId = [aDecoder decodeIntegerForKey:@"elementId"];
        self.name = [aDecoder decodeObjectOfClass:NSString.class forKey:@"name"];
        self.elementType = [aDecoder decodeIntegerForKey:@"elementType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_elementId forKey:@"elementId"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_elementType forKey:@"elementType"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

#pragma mark - Description 

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ with id: %ld", NSStringFromClass(self.class), (long) self.elementId];
}

@end
