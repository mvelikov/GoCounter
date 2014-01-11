//
//  MasterStatisticsViewController.h
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterStatisticsViewController : UITableViewController

@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
