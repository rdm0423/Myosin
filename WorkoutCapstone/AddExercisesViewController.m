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

@interface AddExercisesViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (strong, nonatomic) NSFetchRequest *searchFetchRequest;
@property (strong, nonatomic) NSArray *filteredList;
@property (nonatomic, strong) UIView *containerView;
//@property (nonatomic, strong) NSMutableArray *cellSelected;

@end

@implementation AddExercisesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.managedObjectContext = [[Stack sharedInstance] managedObjectContext];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.searchBar.delegate = self;
//    self.cellSelected = [NSMutableArray array];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self searchForText:searchText];
    [self.tableview reloadData];
}



- (void)searchForText:(NSString *)searchText {
    
    // search how to make a predicate if string = 0 and do an if/else to show the whole list of data
    
    NSString *predicateFormat = @"%K BEGINSWITH[cd] %@";
    NSString *searchAttribute = @"name";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateFormat, searchAttribute, searchText];
    [self.searchFetchRequest setPredicate:predicate];
    
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
//    if ([self.cellSelected containsObject:indexPath]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
    
    // Configure the cell
    Exercise *info = nil;

    info = [self.filteredList objectAtIndex:indexPath.row];

    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Muscle Target: %@  Level: %@",
                                 info.muscleWorked, info.level];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.containerView];
    
    UILabel *exerciseGuide = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 150, 300)];
    Exercise *setsGuide = nil;
    exerciseGuide.text = setsGuide.guide;
    exerciseGuide.numberOfLines = 0;
    
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dismissButton setImage:[UIImage imageNamed:@"deletecircle"] forState:UIControlStateNormal];
    dismissButton.frame = CGRectMake(CGRectGetMaxX(self.containerView.frame) - 40, 32, 30, 30);
    [dismissButton addTarget:self action:@selector(dismissContainerView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.containerView addSubview:dismissButton];
    
}

- (void)dismissContainerView {
    [self.containerView removeFromSuperview];
}

@end
