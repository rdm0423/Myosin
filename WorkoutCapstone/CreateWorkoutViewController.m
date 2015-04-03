//
//  CreateWorkoutViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "CreateWorkoutViewController.h"

@interface CreateWorkoutViewController ()
@property (weak, nonatomic) IBOutlet UITextField *workoutName;
@property (weak, nonatomic) IBOutlet UIPickerView *workoutFocusAreaPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *setsPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *repsPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *restTimeSegmentedControl;

@end

@implementation CreateWorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancel:(id)sender {
    
}

- (IBAction)addExercisesButton:(id)sender {
    
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
