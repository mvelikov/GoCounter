//
//  MasterStatisticsViewController.m
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import "MasterStatisticsViewController.h"
#import "DetailStatisticsViewController.h"

@interface MasterStatisticsViewController ()

@end

@implementation MasterStatisticsViewController

@synthesize categories;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    categories = [[NSArray alloc] initWithObjects:@"By Group", @"By Date", @"By Hour", nil];
    self.detailViewController = (DetailStatisticsViewController*) [[self.splitViewController.viewControllers lastObject] topViewController];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    
    NSString *categoryName = categories[indexPath.row];
    cell.textLabel.text = categoryName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Configure the cell...
    
    return cell;
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showResults"]) {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];

        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

        [[segue destinationViewController] setSelectedCategory: indexPath.row];
    }
}

@end
