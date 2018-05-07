//
//  ViewController.m
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NewsListViewController.h"
#import "NookoSDK.h"
#import "News.h"
#import "NewsTableViewCell.h"
#import "NewsDetailViewController.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 60;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
        
    [self loadNews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) loadNews {
    NSInteger newsBlockId = 12;
    NSDictionary *mappingDictionary = @{@"title" : @"title",
                                        @"content" : @"content",
                                        @"image.firstImage.url" : @"imageUrl",
                                        @"link" : @"link"};
    NKUploadableElementsFactory *factory = [[NKUploadableElementsFactory alloc] initWithLocaleIdentifier:@"it"];
    UIImage *image = [UIImage imageNamed:@"TestImage"];
    UIImage *image1 = [UIImage imageNamed:@"TestImage1"];
    NSArray *elements = @[[factory textElementWithName:@"title" Text:@"Nuovo title3"],
                          [factory textElementWithName:@"content" Text:@"Nuovo contenuto asd"],
                          [factory imageElementWithName:@"image" Image:image Index:0],
                          [factory imageElementWithName:@"image" Image:image1 Index:1]];
    
    [[NKManager sharedManager] addSectionToBlockWithBlockId:newsBlockId Elements:elements Success:^{
        NSMutableArray *newsArray = [[NSMutableArray alloc] init];
        [[NKManager sharedManager] getBlockWithBlockId:newsBlockId Parameters:nil IncludingSections:YES AndElements:YES Success:^(NKBlock *block) {
            self.navigationItem.title = block.title;
            for (NKSection *section in block.sections){
                News *n = [[News alloc] init];
                [section mapElementsToObject:n withMapping:mappingDictionary];
                [newsArray addObject:n];
            }
            self->news = newsArray;
            [self.tableView reloadData];
        } Failure:^(NSError * error) {
            [self showError:error];
        }];
    } Failure:^(NSError * _Nonnull error) {
        [self showError:error];
    }];
}

- (void) showError: (NSError *) error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
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
    cell.imgView.layer.cornerRadius = 3;
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
    [self performSegueWithIdentifier:@"showDetail" sender:indexPath];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]){
        NewsDetailViewController *destination = segue.destinationViewController;
        if ([sender isKindOfClass:[NSIndexPath class]]){
            News *n = [news objectAtIndex:[(NSIndexPath *)sender item]];
            destination.news = n;
        }
    }
}

@end
