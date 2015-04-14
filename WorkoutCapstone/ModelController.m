//
//  ModelController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/26/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ModelController.h"
#import "Workout.h"

@implementation ModelController

+ (ModelController *)sharedInstance {
    static ModelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ModelController new];
    });
    return sharedInstance;
}

- (void)addWorkoutWithName:(NSString *)name withSets:(NSNumber *)sets withReps:(NSNumber *)reps withRest:(NSNumber *)restTime withFocusArea:(NSString *)focusArea {
    PFObject *workoutAdded = [PFObject objectWithClassName:@"Workout"];
    workoutAdded[@"name"] = name;
    workoutAdded[@"sets"] = sets;
    workoutAdded[@"reps"] = reps;
    workoutAdded[@"focusArea"] = focusArea;
    workoutAdded[@"restTime"] = restTime;
    
}

- (void)addExerciseWithName:(NSString *)name toWorkout:(Workout *)workout {
    PFObject *exerciseAdded = [PFObject objectWithClassName:@"Excercise"];
    exerciseAdded[@"name"] = name;
    exerciseAdded[@"workout"] = workout;
    [exerciseAdded saveInBackground];
}

@end
