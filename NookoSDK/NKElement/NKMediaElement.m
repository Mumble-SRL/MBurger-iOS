//
//  NKMediaElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKMediaElement.h"

@implementation NKMediaElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Medias: (NSArray <NKMedia *> *) medias MediaType: (NKMediaType) mediaType{
    self = [super initWithElementId:elementId Name:name Type:NKElementTypeMedia];
    if (self){
        self.medias = medias;
        self.mediaType = mediaType;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSArray *medias = nil;
    NKMediaType mediaType = [self mediaTypeForElementType:dictionary[@"type"]];
    if (dictionary[@"value"] != nil && dictionary[@"value"] != [NSNull null]){
        NSMutableArray *mediaMutable = [[NSMutableArray alloc] init];
        NSArray *mediaFromapi = dictionary[@"value"];
        for (NSDictionary *mediaDictionary in mediaFromapi){
            NKMedia *media = [[NKMedia alloc] initWithDictionary:mediaDictionary];
            if (media){
                [mediaMutable addObject:media];
            }
        }
        medias = mediaMutable;
    }
    return [self initWithElementId:elementId Name:name Medias:medias MediaType:mediaType];
}

- (NKMediaType) mediaTypeForElementType: (NSString *) elementType {
    if ([elementType isEqualToString:@"audio"]){
        return NKMediaTypeAudio;
    }
    else if ([elementType isEqualToString:@"video"]){
        return NKMediaTypeVideo;
    }
    else if ([elementType isEqualToString:@"file"]){
        return NKMediaTypeFile;
    }
    else if ([elementType isEqualToString:@"document"]){
        return NKMediaTypeDocument;
    }
    return NKMediaTypeFile;
}

#pragma mark - Value

- (id) value {
    return self.medias;
}

- (NSString *) fileTypeDescription {
    switch (self.mediaType) {
        case NKMediaTypeAudio:
            return @"Audio";
            break;
        case NKMediaTypeVideo:
            return @"Video";
            break;
        case NKMediaTypeDocument:
            return @"Document";
            break;
        case NKMediaTypeFile:
            return @"File";
            break;
        default:
            break;
    }
    return @"File";
}

- (NKMedia * _Nullable) firstMedia{
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
