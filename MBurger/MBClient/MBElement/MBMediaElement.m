//
//  MBMediaElement.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBMediaElement.h"

@implementation MBMediaElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Medias: (NSArray <MBFile *> *) medias MediaType: (MBMediaType) mediaType{
    self = [super initWithElementId:elementId Name:name Order:order Type:MBElementTypeMedia];
    if (self){
        self.medias = medias;
        self.mediaType = mediaType;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSArray *medias = nil;
    MBMediaType mediaType = [self mediaTypeForElementType:dictionary[@"type"]];
    if (dictionary[@"value"] != nil && dictionary[@"value"] != [NSNull null]){
        NSMutableArray *mediaMutable = [[NSMutableArray alloc] init];
        NSArray *mediaFromapi = dictionary[@"value"];
        for (NSDictionary *mediaDictionary in mediaFromapi){
            MBFile *media = [[MBFile alloc] initWithDictionary:mediaDictionary];
            if (media){
                [mediaMutable addObject:media];
            }
        }
        medias = mediaMutable;
    }
    return [self initWithElementId:elementId Name:name Order:order Medias:medias MediaType:mediaType];
}

- (MBMediaType) mediaTypeForElementType: (NSString *) elementType {
    if ([elementType isEqualToString:@"audio"]){
        return MBMediaTypeAudio;
    }
    else if ([elementType isEqualToString:@"video"]){
        return MBMediaTypeVideo;
    }
    else if ([elementType isEqualToString:@"file"]){
        return MBMediaTypeFile;
    }
    else if ([elementType isEqualToString:@"document"]){
        return MBMediaTypeDocument;
    }
    return MBMediaTypeFile;
}

#pragma mark - Value

- (id) value {
    return self.medias;
}

- (NSString *) fileTypeDescription {
    switch (self.mediaType) {
        case MBMediaTypeAudio:
            return @"Audio";
            break;
        case MBMediaTypeVideo:
            return @"Video";
            break;
        case MBMediaTypeDocument:
            return @"Document";
            break;
        case MBMediaTypeFile:
            return @"File";
            break;
        default:
            break;
    }
    return @"File";
}

- (MBFile *) firstMedia{
    if (self.medias.count > 0){
        return self.medias.firstObject;
    }
    return nil;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.medias = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"medias"];
        self.mediaType = [aDecoder decodeIntegerForKey:@"mediaType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_medias forKey:@"medias"];
    [aCoder encodeInteger:_mediaType forKey:@"mediaType"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
