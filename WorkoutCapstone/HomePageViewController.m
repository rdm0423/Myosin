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
@property (nonatomic, strong) NSArray *temporaryExercises;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // Parse
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
    
    self.datasource = [HomePageDatesource new];
    self.tableview.dataSource = self.datasource;
    self.tableview.delegate = self;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 84;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableview reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark - swipe to delete Methods

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Edit");
//        CreateWorkoutViewController *createWVC = [CreateWorkoutViewController new];
//        
//        [self presentViewController:createWVC animated:YES completion:nil];
    }];
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Foo Delete");
    }];
    return @[deleteAction, editAction];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"newWorkout"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        CreateWorkoutViewController *createNewWorkoutViewController = [[navigationController viewControllers] firstObject];
        self.workout = [[WorkoutController sharedInstance] createWorkout];
        createNewWorkoutViewController.workout = self.workout;
        __weak typeof(self) weakSelf = self;
        __weak typeof(createNewWorkoutViewController) weakController = createNewWorkoutViewController;
        createNewWorkoutViewController.didFinish = ^{
            weakSelf.temporaryExercises = weakController.temporaryExercises;
            [weakSelf dismissViewControllerAnimated:true completion:^{
//                weakSelf.temporaryExercises = nil;
            }];
        };
    } else if ([segue.identifier isEqualToString:@"workoutMode"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        WorkoutModeViewController *workoutModeViewController = [navigationController.viewControllers firstObject];
        NSIndexPath *indexPathCell = [self.tableview indexPathForCell:sender];
        Workout *workout = [WorkoutController sharedInstance].workouts[indexPathCell.row];
        workoutModeViewController.workout = workout;
    }
}

@end
