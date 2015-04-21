//
//  HomePageViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageDatesource.h"
#import "HomePageTableViewCell.h"
#import "CreateWorkoutViewController.h"
#import "WorkoutController.h"
#import "WorkoutModeViewController.h"
#import "Stack.h"
#import "Workout.h"

@interface HomePageViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) HomePageDatesource *datasource;
@property (nonatomic, strong) Workout *workout;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"Myosin";
    // Parse
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    // Tableview
//    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.datasource = [HomePageDatesource new];
    self.tableview.dataSource = self.datasource;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 84;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

// toolbar methods
- (void)viewWillAppear:(BOOL)animated {
    [self.tableview reloadData];
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"newWorkout"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        CreateWorkoutViewController *createNewWorkoutViewController = [[navigationController viewControllers] firstObject];
        createNewWorkoutViewController.workout = [[WorkoutController sharedInstance] createWorkout];
    } else if ([segue.identifier isEqualToString:@"workoutMode"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        WorkoutModeViewController *workoutModeViewController = [navigationController.viewControllers firstObject];
//        workoutModeViewController.workout = self.workout;
    }
}

@end
