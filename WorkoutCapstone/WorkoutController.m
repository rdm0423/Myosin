//
//  WorkoutController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/18/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "WorkoutController.h"
#import "Stack.h"

@implementation WorkoutController

+ (WorkoutController *)sharedInstance {
    static WorkoutController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WorkoutController new];
    });
    return sharedInstance;
    
}

- (Workout *)createWorkout {
    Workout *workout = [NSEntityDescription insertNewObjectForEntityForName:@"Workout" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    return workout;
}

- (void)removeWorkout:(Workout *)workoutToRemove {
    [workoutToRemove.managedObjectContext deleteObject:workoutToRemove];
    [[Stack sharedInstance] save];
}

- (NSArray *)workouts {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Workout"];
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:nil];
}

@end
