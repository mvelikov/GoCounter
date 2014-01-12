//
//  MasterCampaignsViewController.m
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import "MasterCampaignsViewController.h"
#import "DetailViewController.h"

@interface MasterCampaignsViewController ()
@property (strong, nonatomic) UITextField *nameField;
@end

@implementation MasterCampaignsViewController
@synthesize nameField;
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
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 256.0f, 32.0f)];
    [nameField setBackgroundColor:[UIColor whiteColor]];
    [nameField setTextAlignment:NSTextAlignmentCenter];
    //To make the border look very close to a UITextField
    [nameField.layer setBorderColor:[[UIColor colorWithRed:152 green:152 blue:152 alpha:1.0] CGColor]];
    [nameField.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    nameField.layer.cornerRadius = 5;
    nameField.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)insertNewObject:(id)sender
{
    
    UIAlertView *alertView = [[UIAlertView alloc ] initWithTitle:@"title"
                                                         message:@"text"
                                                        delegate:nil
                                               cancelButtonTitle:@"Cancel"
                                               otherButtonTitles:@"OK", nil];
    alertView.delegate = self;
    
    [alertView setValue:nameField forKey:@"accessoryView"];
    [alertView show];
}

#pragma mark - Alert View Delegate Methods

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1 && ![nameField.text isEqualToString:@""]) { // OK button tapped
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
        
        // If appropriate, configure the new managed object.
        // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
        [newManagedObject setValue:nameField.text forKey:@"name"];
        [nameField setText:@""];
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    [nameField becomeFirstResponder];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.detailViewController setManagedObjectContext:self.managedObjectContext];
        [self.detailViewController configureView];
    }
}

@end
