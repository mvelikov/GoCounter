//
//  DetailViewController.h
//  GoCounter
//
//  Created by mihata on 1/6/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
