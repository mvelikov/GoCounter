//
//  MasterStatisticsViewController.h
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailStatisticsViewController;

@interface MasterStatisticsViewController : UITableViewController

@property (strong, nonatomic) DetailStatisticsViewController *detailViewController;

@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
