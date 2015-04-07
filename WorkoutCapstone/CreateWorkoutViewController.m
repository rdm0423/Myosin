//
//  CreateWorkoutViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "CreateWorkoutViewController.h"

@interface CreateWorkoutViewController ()
{
    NSArray *_workoutFocusAreaData;
    NSArray *_setsRepsPickerData;
}

@property (weak, nonatomic) IBOutlet UITextField *workoutName;
@property (weak, nonatomic) IBOutlet UIPickerView *workoutFocusAreaPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *setsRepsPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *restTimeSegmentedControl;



@end

@implementation CreateWorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize Data
    _workoutFocusAreaData = @[@"Bicep", @"Back", @"Shoulder", @"Legs", @"Core", @"Tricep", @"Upper Body", @"Cardio"];
    _setsRepsPickerData = @[@[@"1", @"1"],
                            @[@"2", @"2"],
                            @[@"3", @"3"],
                            @[@"4", @"4"],
                            @[@"5", @"5"],
                            @[@"", @"6"],
                            @[@"", @"7"],
                            @[@"", @"8"],
                            @[@"", @"9"],
                            @[@"", @"10"],
                            @[@"", @"11"],
                            @[@"", @"12"]];
                            
    
    // Connect data
    self.workoutFocusAreaPicker.dataSource = self;
    self.workoutFocusAreaPicker.delegate = self;
    self.setsRepsPicker.dataSource = self;
    self.setsRepsPicker.delegate = self;
    
}

//- (NSArray *)workoutFocusAreaPickerAtIndexes:(NSIndexSet *)indexes {
//    
//}


- (IBAction)restTimeSegmentedSelected:(id)sender {
}

- (IBAction)cancel:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addExercisesButton:(id)sender {
    
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _workoutFocusAreaData[row];
    return _setsRepsPickerData[component][row];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.workoutFocusAreaPicker) {
        return 1;
    } else {
        return 2;
    }
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _workoutFocusAreaData.count;
    return _setsRepsPickerData.count;
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
