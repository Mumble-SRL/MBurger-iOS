//
//  NKWysiwygElement.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKWysiwygElement.h"
#import <UIKit/UIKit.h>

@implementation NKWysiwygElement

- (instancetype) initWithElementId: (NSInteger) elementId Name: (NSString *) name Order: (NSInteger) order Wysiwyg: (NSString *) wysiwyg{
    self = [super initWithElementId:elementId Name:name Order:order Type:NKElementTypeWysiwyg];
    if (self){
        self.wysiwyg = wysiwyg;
    }
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) dictionary{
    NSInteger elementId = [dictionary[@"id"] integerValue];
    NSString *name = dictionary[@"name"];
    NSInteger order = [dictionary[@"order"] integerValue];
    NSString *wysiwyg = dictionary[@"value"];
    return [self initWithElementId:elementId Name:name Order:order Wysiwyg:wysiwyg];
}

#pragma mark - Value

- (NSAttributedString *) attributedString: (NSError * *) error{
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[self.wysiwyg dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:error];
    return attrStr;
}

- (id) value {
    return self.wysiwyg;
}

#pragma mark - NSCoding-NSSecureCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        self.wysiwyg = [aDecoder decodeObjectOfClass:NSString.class forKey:@"wysiwyg"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_wysiwyg forKey:@"wysiwyg"];
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
