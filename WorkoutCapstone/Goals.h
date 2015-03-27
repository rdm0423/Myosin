//
//  Goals.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>
#import "Workout.h"
#import "Analytics.h"

@interface Goals : PFObject

@property (nonatomic, strong) Workout *numberOfWorkouts;
@property (nonatomic, strong) Analytics *workoutCompletionSuccessRate;

@end
