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
#import "NewsTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 60;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    [[NKManager sharedManager] getElementsWithSectionId:826 Success:^(NSDictionary * _Nonnull elements) {
        
    } Failure:^(NSError * _Nonnull error) {
        
    }];
    
    [self loadNews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadNews {
    NSInteger newsBlockId = 12;
    NSDictionary *mappingDictionary = @{@"title" : @"title",
                                        @"content" : @"newsContent",
                                        @"image.firstImage.url" : @"imageUrl",
                                        @"link" : @"link"};
    NSMutableArray *newsArray = [[NSMutableArray alloc] init];
    [[NKManager sharedManager] getSectionsWithBlockId:newsBlockId Parameters:nil IncludeElements:TRUE Success:^(NSArray<NKSection *> *sections, NKMetaInfo *metaInfo) {
        for (NKSection *section in sections){
            News *n = [[News alloc] init];
            [section mapElementsToObject:n withMapping:mappingDictionary];
            [newsArray addObject:n];
        }
        self->news = newsArray;
        [self.tableView reloadData];
    } Failure:^(NSError * _Nonnull error) {
        
    }];
}

#pragma mark - TableView DataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return news.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    
    News *n = [news objectAtIndex:indexPath.item];
    
    cell.labelTitle.numberOfLines = 2;
    cell.labelTitle.text = n.title;
    
    cell.imgView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imgView.clipsToBounds = TRUE;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:n.imageUrl] scale:1.0];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            cell.imgView.image = img;
        });
    });
    return cell;
}

#pragma mark - TableView Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
