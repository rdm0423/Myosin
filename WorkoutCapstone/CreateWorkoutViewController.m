//
//  CreateWorkoutViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "CreateWorkoutViewController.h"
#import "Exercise.h"
#import "AddExercisesViewController.h"
#import "Stack.h"
#import "WorkoutController.h"
#import "ExercisePlanned.h"


@interface CreateWorkoutViewController () <UITextFieldDelegate, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *workoutName;
@property (weak, nonatomic) IBOutlet UITextField *workoutFocusAreaTextField;
@property (weak, nonatomic) IBOutlet UITextField *workoutSetsTextField;
@property (weak, nonatomic) IBOutlet UITextField *workoutRepsTextField;

@property (nonatomic, strong) UIPickerView *workoutFocusAreaPicker;
//@property (nonatomic, strong) UIPickerView *setsPicker;
//@property (nonatomic, strong) UIPickerView *repsPicker;

@property (nonatomic, strong) Exercise *selectedExercise;



@property (weak, nonatomic) IBOutlet UISegmentedControl *restTimeSegmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation CreateWorkoutViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.tableview reloadData];
    [self addDoneButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addDoneButton];
    
    self.temporaryExercises = [[NSArray alloc]init];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    self.tableview.allowsMultipleSelectionDuringEditing = NO;
    
    // sets pickerview
    self.workoutFocusAreaPicker = [UIPickerView new];
    self.workoutFocusAreaPicker.dataSource = self;
    self.workoutFocusAreaPicker.delegate = self;
    self.workoutFocusAreaTextField.inputView = self.workoutFocusAreaPicker;
    
    // Segmented Control
    self.restTimeSegmentedControl.selectedSegmentIndex = 0;
}

- (IBAction)restTimeSegmentedSelected:(id)sender {
    
    if (self.restTimeSegmentedControl.selectedSegmentIndex == 0) {
        self.workout.restTime = @30;
    } else if (self.restTimeSegmentedControl.selectedSegmentIndex == 1) {
        self.workout.restTime = @45;
    } else if (self.restTimeSegmentedControl.selectedSegmentIndex == 2) {
        self.workout.restTime = @60;
    }
}

// textfield picker
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.workoutFocusAreaPicker) {
        self.workoutFocusAreaTextField.text = [self focusAreaArray][[pickerView selectedRowInComponent:0]];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (pickerView == self.workoutFocusAreaPicker) {
        return [self focusAreaArray][row];
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
    } else {
        return 0;
    }
}

- (NSArray *)focusAreaArray {
    return @[@"Bicep", @"Back", @"Shoulder", @"Legs", @"Core", @"Tricep", @"Upper Body", @"Cardio"];
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:self];
}

#pragma mark - TableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workout.plannedExercises.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == self.workout.plannedExercises.count) {
        UITableViewCell *addExerciseCell = [UITableViewCell new];
        addExerciseCell.textLabel.text = @"Add Exercise";
        addExerciseCell.imageView.image = [UIImage imageNamed:@"add"];
        addExerciseCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return addExerciseCell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        ExercisePlanned *planned = [self.workout.plannedExercises objectAtIndex:indexPath.row];
        
        Exercise *exercise = planned.exercise;
        cell.textLabel.text = exercise.name;
        return cell;
    }
}

- (IBAction)saveButton:(id)sender {
    self.workout.name = self.workoutName.text;
    self.workout.focusArea = self.workoutFocusAreaTextField.text;
    self.workout.sets = [NSNumber numberWithInteger:[self.workoutSetsTextField.text integerValue]];
    self.workout.reps =  [NSNumber numberWithInteger:[self.workoutRepsTextField.text integerValue]];
//    self.workout.restTime  *REST TIME SET ON SEGMENT CHANGED*
    self.didFinish();
    
    [[Stack sharedInstance] save];
    
}

- (IBAction)cancelButton:(id)sender {
    [[WorkoutController sharedInstance] removeWorkout:self.workout];
    [[Stack sharedInstance] save];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma Mark - Dismiss Keyboard (numberPad)

//- (void)dismissKeyboard {
//    [self.workoutFocusAreaTextField resignFirstResponder];
//    [self.workoutSetsTextField resignFirstResponder];
//    [self.workoutRepsTextField resignFirstResponder];
//}

- (void)addDoneButton {
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self.view action:@selector(endEditing:)];
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    self.workoutRepsTextField.inputAccessoryView = keyboardToolbar;
    self.workoutSetsTextField.inputAccessoryView = keyboardToolbar;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        AddExercisesViewController *addExercisesViewController = [navigationController.viewControllers firstObject];
        addExercisesViewController.workout = self.workout;
    }
}


@end
