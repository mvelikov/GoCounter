//
//  DetailStatisticsViewController.m
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import "DetailStatisticsViewController.h"

@interface DetailStatisticsViewController ()
@property (strong, nonatomic) NSMutableArray *categoriesCount;
@end

@implementation DetailStatisticsViewController
@synthesize categories, categoriesCount;
- (void)viewDidLoad
{
    [super viewDidLoad];
    categories = [Helper getCategories];
    categoriesCount = [[NSMutableArray alloc] init];
    categoriesCount = [self getCalculatedCustomersByCategory];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    categoriesCount = [self getCalculatedCustomersByCategory];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setManagedObjectContext:(NSManagedObjectContext *)newManagedContext {
    if (_managedObjectContext != newManagedContext) {
        _managedObjectContext = newManagedContext;
    }
}

- (void) setCampaignObject:(Campaign*) newCampaignObject {
    if (_campaignObject != newCampaignObject) {
        _campaignObject = newCampaignObject;
    }
}

- (NSMutableArray*) getCalculatedCustomersByCategory {
    NSMutableArray *ctgryArray;
    ctgryArray = [[NSMutableArray alloc] init];
    for (int idx = 0; idx < [categories count]; idx++) {
        ctgryArray[idx] = [[NSNumber alloc] initWithInt:0];
    }
    NSNumber *cnt;
    for (Customer* cst in _campaignObject.customers) {

        cnt = [ctgryArray objectAtIndex:[cst.age integerValue]];
        int tmp = [cnt intValue];
        cnt = [NSNumber numberWithInt:++tmp];
        ctgryArray[[cst.age integerValue]] = cnt;

    }

    return ctgryArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...

    UILabel *countBadgeLabel = (UILabel*)[cell.contentView viewWithTag:23];
    if (countBadgeLabel == nil) {
         countBadgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 64, 8, cell.frame.size.height, cell.frame.size.height - 16)];
    }
    [countBadgeLabel setTag:23];
    [countBadgeLabel setTextAlignment:NSTextAlignmentCenter];
    countBadgeLabel.layer.cornerRadius = cell.frame.size.height / 4;
    countBadgeLabel.text = [[NSString alloc] initWithFormat:@"%@", categoriesCount[indexPath.row]];

    [countBadgeLabel setShadowColor:[UIColor lightGrayColor]];
    [countBadgeLabel setBackgroundColor:[UIColor colorWithRed:200/255 green:200/255 blue:200/255 alpha:0.1]];
    [countBadgeLabel setShadowOffset:CGSizeMake(1, 1)];
//    [countBadgeLabel sizeToFit];

    [cell.contentView addSubview:countBadgeLabel];
    cell.textLabel.text = [categories[indexPath.row] capitalizedString];

    return cell;
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Customer" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
    
    NSArray *sortDescriptors = @[sortDescriptor];
    //
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//	    abort();
	}
    
    return _fetchedResultsController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    //    [self.tableView reloadData];
}

@end
