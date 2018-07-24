//
//  NewsDetailViewController.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
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
