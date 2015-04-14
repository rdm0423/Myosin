//
//  AddExercisesViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/3/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "AddExercisesViewController.h"
#import "ImportWorkoutsToCoreDataController.h"
#import "Exercise.h"
#import "Stack.h"

@interface AddExercisesViewController () <UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate, UISearchBarDelegate, NSFetchedResultsControllerDelegate, UISearchResultsUpdating>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) UISearchController *searchController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchField;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (strong, nonatomic) NSFetchRequest *searchFetchRequest;
@property (strong, nonatomic) NSArray *filteredList;

@end

@implementation AddExercisesViewController

@synthesize managedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [[self tableview] reloadData];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = YES;
    
    self.tableview.tableHeaderView = self.searchController.searchBar;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.fetchedResultsController = nil;
}

////- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
////{
////    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return 1;
//}

- (void)searchForText:(NSString *)searchText
{
    if (self.managedObjectContext)
    {
        NSString *predicateFormat = @"%K BEGINSWITH[cd] %@";
        NSString *searchAttribute = @"name";
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateFormat, searchAttribute, searchText];
        [self.searchFetchRequest setPredicate:predicate];
        
        NSError *error = nil;
        self.filteredList = [self.managedObjectContext executeFetchRequest:self.searchFetchRequest error:&error];
    }
}

- (NSFetchRequest *)searchFetchRequest
{
    if (_searchFetchRequest != nil)
    {
        return _searchFetchRequest;
    }
    
    _searchFetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Excercise" inManagedObjectContext:self.managedObjectContext];
    [_searchFetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [_searchFetchRequest setSortDescriptors:sortDescriptors];
    
    return _searchFetchRequest;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    [self searchForText:searchString];
    [self.tableview reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.tableview)
    {
        return [[self.fetchedResultsController sections] count];
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableview)
    {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    }
    else
    {
        return [self.filteredList count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (tableView == self.tableview)
    {
        if (index > 0)
        {
            return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index-1];
        }
        else
        {
            self.tableview.contentOffset = CGPointZero;
            return NSNotFound;
        }
    }
    else
    {
        return 0;
    }
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    id  sectionInfo =
//    [[self.fetchedResultsController sections] objectAtIndex:section];
//    return [sectionInfo numberOfObjects];
//}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Exercise *info = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Muscle Target: %@, Level: %@",
                                 info.muscleWorked, info.level];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
//    [self configureCell:cell atIndexPath:indexPath];
    
    Exercise *info = nil;
    if (tableView == self.tableview)
    {
        info = [self.fetchedResultsController objectAtIndexPath:indexPath];
    }
    else
    {
        info = [self.filteredList objectAtIndex:indexPath.row];
    }

    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Muscle Target: %@, Level: %@",
                                 info.muscleWorked, info.level];

    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - fetchedResultsController

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Exercise" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"name" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSLog(@"%@", [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:fetchRequest error:nil]);
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:[Stack sharedInstance].managedObjectContext sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    [[self tableview] reloadData];

    return _fetchedResultsController;
    
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableview beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableview;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            [[self tableview] reloadData];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
         case NSFetchedResultsChangeUpdate:
            [self.tableview insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            [[self tableview] reloadData];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableview insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeInsert:
            [self.tableview insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableview deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableview endUpdates];
}

#pragma Mark - SearchDisplay 

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    if (tableView == self.tableview) {
//        return ;
//    }
//    // If necessary (if self is the data source for other table views),
//    // check whether tableView is searchController.searchResultsTableView.
//    return ...;
//}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
