//
//  CreateWorkoutViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "CreateWorkoutViewController.h"

@interface CreateWorkoutViewController () <UITextFieldDelegate, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *workoutName;
@property (weak, nonatomic) IBOutlet UITextField *workoutFocusAreaTextField;
@property (weak, nonatomic) IBOutlet UITextField *workoutSetsTextField;
@property (weak, nonatomic) IBOutlet UITextField *workoutRepsTextField;

@property (nonatomic, strong) UIPickerView *workoutFocusAreaPicker;
@property (nonatomic, strong) UIPickerView *setsPicker;
@property (nonatomic, strong) UIPickerView *repsPicker;

@property (weak, nonatomic) IBOutlet UISegmentedControl *restTimeSegmentedControl;

@end

@implementation CreateWorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // sets pickerview
    self.workoutFocusAreaPicker = [UIPickerView new];
    self.workoutFocusAreaPicker.dataSource = self;
    self.workoutFocusAreaPicker.delegate = self;
    
    self.setsPicker = [UIPickerView new];
    self.setsPicker.dataSource = self;
    self.setsPicker.delegate = self;
    
    self.repsPicker = [UIPickerView new];
    self.repsPicker.dataSource = self;
    self.repsPicker.delegate = self;
    
    
    self.workoutFocusAreaTextField.inputView = self.workoutFocusAreaPicker;
    self.workoutSetsTextField.inputView = self.setsPicker;
    self.workoutRepsTextField.inputView = self.repsPicker;
    

    
}

- (IBAction)restTimeSegmentedSelected:(id)sender {
    
    if (self.restTimeSegmentedControl.selectedSegmentIndex == 0) {
        
    } else if (self.restTimeSegmentedControl.selectedSegmentIndex == 1) {
        
    } else if (self.restTimeSegmentedControl.selectedSegmentIndex ==2) {
        
    }
}

- (IBAction)cancel:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addExercisesButton:(id)sender {
    
}

// textfield picker
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.workoutFocusAreaTextField.text = [self focusAreaArray][[pickerView selectedRowInComponent:0]];
    self.workoutSetsTextField.text = [self setsArray][[pickerView selectedRowInComponent:0]];
    self.workoutRepsTextField.text = [self repsArray][[pickerView selectedRowInComponent:0]];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (pickerView == self.workoutFocusAreaPicker) {
        return [self focusAreaArray][row];
    } else if (pickerView == self.setsPicker) {
        return [self setsArray][row];
    } else if (pickerView == self.repsPicker) {
        return [self repsArray][row];
    } else {
        return nil;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (pickerView == self.workoutFocusAreaPicker) {
        return [self focusAreaArray].count;
    } else if (pickerView == self.setsPicker) {
        return [self setsArray].count;
    } else if (pickerView == self.repsPicker) {
        return [self repsArray].count;
    } else {
        return 0;
    }
}

- (NSArray *)focusAreaArray {
    return @[@"Bicep", @"Back", @"Shoulder", @"Legs", @"Core", @"Tricep", @"Upper Body", @"Cardio"];
}

- (NSArray *)setsArray {
    return @[@"1", @"2", @"3", @"4", @"5", @"6"];
}

- (NSArray *)repsArray {
    return @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18"];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
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
