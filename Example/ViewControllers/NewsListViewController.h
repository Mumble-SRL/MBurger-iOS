//
//  ViewController.h
//  NookoSDK
//
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *news;
    UIRefreshControl *refreshControl;
}

@property IBOutlet UITableView *tableView;

@end

