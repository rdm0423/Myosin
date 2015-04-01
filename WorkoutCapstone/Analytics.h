//
//  Analytics.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>

static NSString *workoutCompletionKey = @"workoutCompletion";
static NSString *workoutEnergyRateKey = @"workoutEnergyRate";

@interface Analytics : PFObject

@property (nonatomic, assign) NSArray * workouts;
@property (nonatomic, assign) NSArray *workoutEnergyRate;

@end
