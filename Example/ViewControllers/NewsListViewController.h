//
//  ViewController.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *news;
    UIRefreshControl *refreshControl;
}

@property IBOutlet UITableView *tableView;

@end

