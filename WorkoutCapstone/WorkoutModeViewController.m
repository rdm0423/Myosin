//
//  WorkoutModeViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/3/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "WorkoutModeViewController.h"
#import "WorkoutController.h"
#import "ExercisePlanned.h"
#import "Stack.h"
#import "Exercise.h"
#import "WorkoutModeCell.h"

@interface WorkoutModeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *setsLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;
@property (weak, nonatomic) IBOutlet UILabel *focusAreaLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;



@end

@implementation WorkoutModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.workout.name;
    self.setsLabel.text = [NSString stringWithFormat:@"Sets: %@", self.workout.sets];
    self.repsLabel.text = [NSString stringWithFormat:@"Reps: %@", self.workout.reps];
    self.focusAreaLabel.text = [NSString stringWithFormat:@"Focus Area: %@", self.workout.focusArea];
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableview reloadData];
}

- (void)reloadData {
    
}

- (void)reloadRowsAtIndexPaths:(NSArray *)indexpaths withRowAnimation:(UITableViewRowAnimation)animation {
    
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNib:[UINib nibWithNibName:@"WorkoutModeCell" bundle:nil] forCellReuseIdentifier:@"WorkoutModeCustom"];
    
    ExercisePlanned *planned = [self.workout.plannedExercises objectAtIndex:indexPath.row];
    Exercise *exercise = planned.exercise;
    
    if ([planned.completed isEqualToNumber:@1]) {
        WorkoutModeCell *workoutModeCell = [tableView dequeueReusableCellWithIdentifier:@"WorkoutModeCustom"];
        workoutModeCell.workoutNameLabel.text = exercise.name;
        workoutModeCell.workoutDetailLabel.text = [NSString stringWithFormat:@"Muscle: %@   Equipment: %@", exercise.muscleWorked, exercise.equipment];
        
        return workoutModeCell;
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorkoutMode"];
        
        cell.textLabel.text = exercise.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Muscle: %@   Equipment: %@", exercise.muscleWorked, exercise.equipment];
        
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    [self completionCellCheck];
    
    return self.workout.plannedExercises.count;
}

-(void)completionCellCheck
{
    NSMutableArray *completedWorkout = [NSMutableArray new];
    
    for (ExercisePlanned * planned in self.workout.plannedExercises) {
        if ([planned.completed  isEqual: @1]) {
            [completedWorkout addObject:planned];
        }
    };
    
    if (completedWorkout.count  == self.workout.plannedExercises.count) {
        NSLog(@"You've Completed the workout!!!!");
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            
            for (ExercisePlanned * planned in self.workout.plannedExercises) {
                if ([planned.completed  isEqual: @1]) {
                    planned.completed = nil;
                }
            };
            [completedWorkout removeAllObjects];
        }];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ExercisePlanned *planned = [self.workout.plannedExercises objectAtIndex:indexPath.row];
    

    
    if (planned.completed == nil) {
        planned.completed = @1;
        
    } else {
        planned.completed = nil;
    }
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}




- (IBAction)subtractWeightButton:(id)sender {
    
}
- (IBAction)addWeightButton:(id)sender {
    
}


- (IBAction)cancel:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

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
