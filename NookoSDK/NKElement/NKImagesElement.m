//
//  NKImageElement.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKImagesElement.h"

@implementation NKImagesElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Images: (NSArray <NKImage *> *) images{
    self = [super initWithElementId:elementId Name:name Type:NKElementTypeImages];
    if (self){
        self.images = images;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
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
    return [self initWithElementId:elementId Name:name Images:images];
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
