//
//  CreateWorkoutViewController.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddExercisesViewController.h"

@interface CreateWorkoutViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UITableViewCell *addExerciseCell;

@end
