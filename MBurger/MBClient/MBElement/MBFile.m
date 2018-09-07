//
//  MBFile.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBFile.h"

@implementation MBFile

- (instancetype) initWithId: (NSInteger) fileId Url: (NSURL *) url MimeType: (NSString *) mimeType Size: (NSInteger) size{
    self = [super init];
    if (self){
        self.fileId = fileId;
        self.url = url;
        self.mimeType = mimeType;
        self.size = size;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger fileId = [dictionary[@"id"] integerValue];
    NSString *mimeType = dictionary[@"mime_type"];
    NSInteger size = [dictionary[@"size"] integerValue];
    NSString *mediaUrlString = dictionary[@"url"];
    NSURL *mediaUrl = [NSURL URLWithString:mediaUrlString];
    return [self initWithId:fileId Url:mediaUrl MimeType:mimeType Size:size];
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.fileId = [aDecoder decodeIntegerForKey:@"fileId"];
        self.url = [aDecoder decodeObjectOfClass:NSURL.class forKey:@"url"];
        self.mimeType = [aDecoder decodeObjectOfClass:NSString.class forKey:@"mimeType"];
        self.size = [aDecoder decodeIntegerForKey:@"size"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_fileId forKey:@"fileId"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_mimeType forKey:@"mimeType"];
    [aCoder encodeInteger:_size forKey:@"size"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
