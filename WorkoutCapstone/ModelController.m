//
//  ModelController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/26/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ModelController.h"
#import "Stack.h"
#import "Workout.h"
#import "WorkoutParse.h"

@implementation ModelController

+ (ModelController *)sharedInstance {
    static ModelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ModelController new];
    });
    return sharedInstance;
}


-(void)createWorkout
{
    Workout *workout = [NSEntityDescription insertNewObjectForEntityForName:@"Workout" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    [self save];
}

-(void)updateWorkout:(Workout *)workout withName:(NSString *)name withSets:(NSNumber *)sets withReps:(NSNumber *)reps withRest:(NSNumber *)restTime withFocusArea:(NSString *)focusArea
{
        workout.name = name;
        workout.sets = sets;
        workout.reps = reps;
        workout.restTime = restTime;
        workout.focusArea = focusArea;
    
    [self save];
}

-(void)saveExercise:(Exercise *)exercise toWorkout:(Workout *)workout
{
    exercise.workout = workout;
}


-(void)save
{
    
}


//-(void)createWorkout
//{
//    WorkoutParse *workout = [WorkoutParse objectWithClassName:@"Workout"];
//    [workout saveInBackground];
//}
//
//-(void)saveDataToWorkout:(WorkoutParse *)workout name:(NSString *)name withSets:(NSNumber *)sets withReps:(NSNumber *)reps withRest:(NSNumber *)restTime withFocusArea:(NSString *)focusArea
//{
//    workout.name = name;
//    workout.sets = sets;
//    workout.reps = reps;
//    workout.restTime = restTime;
//    workout.focusArea = focusArea;
//    
//    [workout saveInBackground];
//}
//
//-(void)saveExercise:(Exercise *)exercise toWorkout:(WorkoutParse *)workout
//{
//    workout.exercises = exercise;
//    [workout saveInBackground];
//}

@end
