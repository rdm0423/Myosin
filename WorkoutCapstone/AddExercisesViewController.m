//
//  AddExercisesViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/3/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "AddExercisesViewController.h"
#import "ImportWorkoutsToCoreDataController.h"
#import "ExerciseDetailViewController.h"
#import "Exercise.h"
#import "ExercisePlanned.h"
#import "Stack.h"

@interface AddExercisesViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (strong, nonatomic) NSFetchRequest *searchFetchRequest;
@property (strong, nonatomic) NSArray *filteredList;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@property (nonatomic, strong) NSMutableOrderedSet *temporaryExerciseSet;
//@property (nonatomic, strong) NSMutableArray *cellSelected;

@end

@implementation AddExercisesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.managedObjectContext = [[Stack sharedInstance] managedObjectContext];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.searchBar.delegate = self;
    [self searchForText:@""];
    self.temporaryExerciseSet = [NSMutableOrderedSet new];
//    self.cellSelected = [NSMutableArray array];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self searchForText:searchText];
    [self.tableview reloadData];
}


- (void)searchForText:(NSString *)searchText {
    
    if (searchText.length > 0) {
        NSString *predicateFormat = @"%K BEGINSWITH[cd] %@";
        NSString *searchAttribute = @"name";
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateFormat, searchAttribute, searchText];
        [self.searchFetchRequest setPredicate:predicate];
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
        [self.searchFetchRequest setPredicate:predicate];
    }
    
    NSError *error = nil;
    self.filteredList = [self.managedObjectContext executeFetchRequest:self.searchFetchRequest error:&error];
}

- (NSFetchRequest *)searchFetchRequest {
    if (_searchFetchRequest != nil) {
        return _searchFetchRequest;
    }
    
    _searchFetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
    [_searchFetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [_searchFetchRequest setSortDescriptors:sortDescriptors];
    
    return _searchFetchRequest;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.filteredList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    Exercise *info = nil;

    info = [self.filteredList objectAtIndex:indexPath.row];

    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Muscle Target: %@  Level: %@",
                                 info.muscleWorked, info.level];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
//    NSURL *pictureURL = [NSURL URLWithString:info.picture];
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [[[NSURLSession sharedSession] dataTaskWithURL:pictureURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        UIImage *downloadImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:pictureURL]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            cell.imageView.image = downloadImage;
//            [cell setNeedsLayout];
//        });
//    }] resume];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ExercisePlanned *plannedExercise = [NSEntityDescription insertNewObjectForEntityForName:@"ExercisePlanned" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    Exercise *exercise = [self.filteredList objectAtIndex:indexPath.row];
    
    plannedExercise.exercise = exercise;
    plannedExercise.workout = self.workout;
    
    if ([self.temporaryExerciseSet containsObject:plannedExercise]) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.temporaryExerciseSet removeObject:plannedExercise];
        [plannedExercise.managedObjectContext deleteObject:plannedExercise];
    } else {
        [self.temporaryExerciseSet addObject:plannedExercise];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Detail"]) {
        ExerciseDetailViewController *controller = segue.destinationViewController;
        controller.preferredContentSize = CGSizeMake(300, 560);
        controller.popoverPresentationController.delegate = self;
        Exercise *info = [self.filteredList objectAtIndex:self.selectedIndexPath.row];
        controller.exercise = info;
        UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:self.selectedIndexPath];
        controller.popoverPresentationController.sourceView = cell;
        controller.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionRight;
        controller.popoverPresentationController.sourceRect = CGRectMake(cell.frame.size.width - 40, 0, 240, cell.frame.size.height);
    }
    
    if([segue.identifier isEqualToString:@"detail"]) {
        
    }
}

#pragma Mark - swipe to delete Methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    [self setEditing:YES animated:YES];
    //        if (editingStyle == UITableViewCellEditingStyleDelete) {
    //
    //
    //            [tableView reloadData];
    //        }
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Foo Delete");
    }];
    return @[deleteAction];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"Detail" sender:self];
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender {
    [self.temporaryExerciseSet unionOrderedSet:self.workout.plannedExercises];
    self.workout.plannedExercises = [self.temporaryExerciseSet copy];
    self.temporaryExerciseSet = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissContainerView {
    [self.containerView removeFromSuperview];
}

@end
