//
//  ViewController.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "ViewController.h"
#import "NookoSDK.h"
#import "News.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NKTextElement *titleElement = [[NKTextElement alloc] initWithElementId:1 Name:@"Title" Text:@"Titolo della news"];
    NKTextElement *contentElement = [[NKTextElement alloc] initWithElementId:2 Name:@"Description" Text:@"Descrizione della news"];
    NKAddressElement *addressElement = [[NKAddressElement alloc] initWithElementId:4 Name:@"Address" Address:@"via Panini 9" Latitude:100 Longitude:200.2];

    NKSection *news = [[NKSection alloc] initWithSectionId:1 Elements:nil];
    NSMutableDictionary *elements = [[NSMutableDictionary alloc] init];
    elements[titleElement.name] = titleElement;
    elements[contentElement.name] = contentElement;
    elements[addressElement.name] = addressElement;
    news.elements = elements;
    
    News *n1 = [[News alloc] init];
    [news mapElementsToObject:n1 withMapping:@{@"Title" : @"title",
                                               @"Description" : @"newsContent",
                                               @"Image.firstImage.url" : @"imageUrl",
                                               @"Address.address" : @"address",
                                               @"Address.longitude" : @"lng",
                                               @"Address.coordinate.latitude" : @"coordinateLat"
                                               }];
    
    [[NKManager sharedManager] getBlocksWithParameters:@[[[NKFilterParameter alloc] initWithField:@"field" Value:@"value"]] Success:^(NSArray<NKBlock *> * _Nonnull blocks, NKMetaInfo * _Nonnull metaInfo) {
        
    } Failure:^(NSError * _Nonnull error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
