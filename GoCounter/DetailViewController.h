//
//  DetailViewController.h
//  GoCounter
//
//  Created by mihata on 1/6/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Campaign.h"
#import "Customer.h"

@interface DetailViewController : UITableViewController <UISplitViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) NSArray *categories;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Campaign *campaignObject;

- (void) configureView;
- (void) setCampaignObject:(Campaign*) newCampaignObject;
- (void) setManagedObjectContext: (NSManagedObjectContext*)newManagedObjectContext;
@end
