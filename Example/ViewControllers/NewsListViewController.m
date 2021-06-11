//
//  ViewController.m
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NewsListViewController.h"
#import "MBurger.h"
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
    
    [MBClient getSectionsWithBlockId:263 Parameters:nil IncludeElements:TRUE IncludeBeacons: TRUE Success:^(NSArray<MBSection *> * _Nonnull sections, MBPaginationInfo * _Nonnull pagintaionInfo) {
        
    } Failure:^(NSError * _Nonnull error) {
        [self showError:error];
    }];
//    [self loadNews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) loadNews {
    NSInteger newsBlockId = -1; // Change with your blockId
    NSDictionary *mappingDictionary = @{@"title" : @"title",
                                        @"content" : @"content",
                                        @"image.firstImage.url" : @"imageUrl",
                                        @"link" : @"link"};
    
    NSMutableArray *newsArray = [[NSMutableArray alloc] init];
    [MBClient getBlockWithBlockId:newsBlockId Parameters:nil IncludingSections:YES AndElements:YES Success:^(MBBlock *block) {
        self.navigationItem.title = block.title;
        for (MBSection *section in block.sections){
            News *n = [[News alloc] init];
            [section mapElementsToObject:n withMapping:mappingDictionary];
            [newsArray addObject:n];
        }
        self->news = newsArray;
        [self.tableView reloadData];
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
