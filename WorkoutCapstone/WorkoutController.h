//
//  WorkoutController.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/18/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"

@interface WorkoutController : NSObject

+ (WorkoutController *)sharedInstance;
- (Workout *)createWorkout;
- (void)removeWorkout:(Workout *)workoutToRemove;
- (NSArray *)workouts;

@end
