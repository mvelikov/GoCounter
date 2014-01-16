//
//  DetailStatisticsViewController.h
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Campaign.h"
#import "Customer.h"

@interface DetailStatisticsViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) int selectedCategory;
@property (strong, nonatomic) Campaign *campaignObject;
@property (strong, nonatomic) NSArray *categories;

- (void) setCampaignObject:(Campaign*) newCampaignObject;
@end
