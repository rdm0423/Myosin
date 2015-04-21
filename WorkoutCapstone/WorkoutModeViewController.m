//
//  WorkoutModeViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/3/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "WorkoutModeViewController.h"
#import "WorkoutController.h"
#import "Stack.h"
#import "Exercise.h"

@interface WorkoutModeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *setsLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;
@property (weak, nonatomic) IBOutlet UILabel *focusAreaLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (nonatomic, strong) Workout *workout;

@end

@implementation WorkoutModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorkoutMode"];
    
    Exercise *exercise = [self.workout.exercises objectAtIndex:indexPath.row];
    cell.textLabel.text = exercise.name;
    cell.detailTextLabel.text = @"Muscle: %@   Equipment: %@", exercise.muscleWorked, exercise.equipment;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workout.exercises.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
