//
//  NewsDetailViewController.h
//  NookoSDK
//
//  Created by Lorenzo Oliveto on 06/04/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsDetailViewController : UIViewController

@property News *news;

@property IBOutlet UIScrollView *scrollView;
@property IBOutlet UIImageView *imageView;
@property IBOutlet UILabel *labelTitle;
@property IBOutlet UILabel *labelContent;

@end
