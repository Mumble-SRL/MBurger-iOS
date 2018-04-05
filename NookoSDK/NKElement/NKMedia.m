//
//  NKMedia.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 04/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKMedia.h"

@implementation NKMedia

- (instancetype) initWithId: (NSInteger) mediaId Url: (NSURL *) url MimeType: (NSString *) mimeType Size: (NSInteger) size{
    self = [super init];
    if (self){
        self.mediaId = mediaId;
        self.url = url;
        self.mimeType = mimeType;
        self.size = size;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger mediaId = [dictionary[@"id"] integerValue];
    NSString *mimeType = dictionary[@"mime_type"];
    NSInteger size = [dictionary[@"size"] integerValue];
    //TODO: remove url
    NSString *mediaUrlString = [NSString stringWithFormat:@"https://www.nooko2.mumbleserver.it%@", dictionary[@"url"]];
    NSURL *mediaUrl = [NSURL URLWithString:mediaUrlString];
    return [self initWithId:mediaId Url:mediaUrl MimeType:mimeType Size:size];
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.mediaId = [aDecoder decodeIntegerForKey:@"mediaId"];
        self.url = [aDecoder decodeObjectOfClass:NSURL.class forKey:@"url"];
        self.mimeType = [aDecoder decodeObjectOfClass:NSString.class forKey:@"mimeType"];
        self.size = [aDecoder decodeIntegerForKey:@"size"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_mediaId forKey:@"mediaId"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_mimeType forKey:@"mimeType"];
    [aCoder encodeInteger:_size forKey:@"size"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
