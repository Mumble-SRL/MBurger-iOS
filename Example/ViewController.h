//
//  ViewController.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 30/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *news;
    UIRefreshControl *refreshControl;
}

@property IBOutlet UITableView *tableView;

@end

