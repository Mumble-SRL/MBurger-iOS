//
//  NKMediaElement.m
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

#import "NKMediaElement.h"

@implementation NKMediaElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Medias: (NSArray <NKFile *> *) medias MediaType: (NKMediaType) mediaType{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeMedia];
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
    NKMediaType mediaType = [self mediaTypeForElementType:dictionary[@"type"]];
    if (dictionary[@"value"] != nil && dictionary[@"value"] != [NSNull null]){
        NSMutableArray *mediaMutable = [[NSMutableArray alloc] init];
        NSArray *mediaFromapi = dictionary[@"value"];
        for (NSDictionary *mediaDictionary in mediaFromapi){
            NKFile *media = [[NKFile alloc] initWithDictionary:mediaDictionary];
            if (media){
                [mediaMutable addObject:media];
            }
        }
        medias = mediaMutable;
    }
    return [self initWithElementId:elementId Name:name Order:order Medias:medias MediaType:mediaType];
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

- (NKFile *) firstMedia{
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
