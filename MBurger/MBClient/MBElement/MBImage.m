//
//  MBImage.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBImage.h"

@implementation MBImage

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
    NSString* imageUrlEscaped = [imageUrlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSURL *imageUrl = [NSURL URLWithString:imageUrlEscaped];
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
