//
//  NKImageElement.m
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

#import "NKImagesElement.h"

@implementation NKImagesElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Images: (NSArray <NKImage *> *) images{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeImages];
    if (self){
        self.images = images;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSArray *images = nil;
    if (dictionary[@"value"] != nil && dictionary[@"value"] != [NSNull null]){
        NSMutableArray *imagesMutable = [[NSMutableArray alloc] init];
        NSArray *imagesFromapi = dictionary[@"value"];
        for (NSDictionary *imageDictionary in imagesFromapi){
            NKImage *image = [[NKImage alloc] initWithDictionary:imageDictionary];
            if (image){
                [imagesMutable addObject:image];
            }
        }
        images = imagesMutable;
    }
    return [self initWithElementId:elementId Name:name Order:order Images:images];
}

#pragma mark - Value

- (id) value{
    return self.images;
}

- (NKImage *) firstImage{
    if (self.images.count > 0){
        return self.images.firstObject;
    }
    return nil;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.images = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"images"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_images forKey:@"images"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
