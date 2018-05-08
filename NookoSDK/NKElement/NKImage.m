//
//  NKImage.m
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

#import "NKImage.h"

@implementation NKImage

- (instancetype) initWithId: (NSInteger) imageId Url: (NSURL *) url MimeType: (NSString *) mimeType Size: (NSInteger) size{
    self = [super init];
    if (self){
        self.imageId = imageId;
        self.url = url;
        self.mimeType = mimeType;
        self.size = size;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger imageId = [dictionary[@"id"] integerValue];
    NSString *mimeType = dictionary[@"mime_type"];
    NSInteger size = [dictionary[@"size"] integerValue];
    NSString *imageUrlString = dictionary[@"url"];
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    return [self initWithId:imageId Url:imageUrl MimeType:mimeType Size:size];
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.imageId = [aDecoder decodeIntegerForKey:@"imageId"];
        self.url = [aDecoder decodeObjectOfClass:NSURL.class forKey:@"url"];
        self.mimeType = [aDecoder decodeObjectOfClass:NSString.class forKey:@"mimeType"];
        self.size = [aDecoder decodeIntegerForKey:@"size"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_imageId forKey:@"imageId"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_mimeType forKey:@"mimeType"];
    [aCoder encodeInteger:_size forKey:@"size"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
