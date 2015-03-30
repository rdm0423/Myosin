//
//  Workout.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>
#import "Exercise.h"

static NSString *workoutNameKey = @"workoutName";
static NSString *workoutSetsKey = @"workoutSets";
static NSString *workoutRepsKey = @"workoutReps";
static NSString *workoutFocusAreaKey = @"workoutFocusArea";
static NSString *workoutCircuitModeKey = @"workoutCircuitMode";
static NSString *workoutRestKey = @"workoutRest";
static NSString *postWorkoutNoteKey = @"postWorkoutNote";
static NSString *workoutCompletedKey = @"workoutCompleted";
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
