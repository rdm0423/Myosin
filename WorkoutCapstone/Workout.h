//
//  Workout.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>
#import "Exercise.h"

static NSString *workoutNameKey = @"workoutNameKey";
static NSString *workoutSetsKey = @"workoutSetsKey";
static NSString *workoutRepsKey = @"workoutRepsKey";
static NSString *workoutFocusAreaKey = @"workoutFocusAreaKey";
static NSString *workoutCircuitModeKey = @"workoutCircuitModeKey";
static NSString *workoutRestKey = @"workoutRestKey";
static NSString *postWorkoutNoteKey = @"postWorkoutNoteKey";
static NSString *workoutCompletedKey = @"workoutCompletedKey";
static NSString *workoutDateKey = @"workoutDateKey";

@interface Workout : PFObject

@property (nonatomic, strong) NSString *workoutName;
@property (nonatomic, assign) NSInteger *workoutSets;
@property (nonatomic, assign) NSInteger *workoutReps;
@property (nonatomic, strong) NSArray *workoutFocusArea;
@property (nonatomic, assign) BOOL workoutCircuitMode;
@property (nonatomic, assign) NSInteger *workoutRest;
@property (nonatomic, strong) NSString *postWorkoutNote;
@property (nonatomic, assign) BOOL workoutCompleted;
@property (nonatomic, strong) NSDate *workoutDate;

@property (nonatomic) Exercise *exercise;

@end
