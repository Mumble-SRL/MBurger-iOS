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
    
    /*
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
    */
    
    [NKManager sharedManager].apiToken = @"26c96ab3c9a67f45cc2e9bff35869bfd8a778cb0";
    
    /*
    [[NKManager sharedManager] getProjectWithSuccess:^(NKProject *project) {
        
    } Failure:^(NSError *error) {
        
    }];
    
    */
    [[NKManager sharedManager] getBlocksWithParameters:nil Success:^(NSArray<NKBlock *> * _Nonnull blocks, NKMetaInfo * _Nonnull metaInfo) {
        [[NKManager sharedManager] getSectionsWithBlockId:[blocks objectAtIndex:1].blockId Parameters:nil Success:^(NSArray<NKSection *> *sections, NKMetaInfo *metaInfo) {
            [[NKManager sharedManager] getSectionWithId:sections.firstObject.sectionId IncludeElements: TRUE Success:^(NKSection * section) {
                
            } Failure:^(NSError * _Nonnull error) {
                
            }];
        } Failure:^(NSError *error) {
            
        }];
    } Failure:^(NSError * _Nonnull error) {
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
