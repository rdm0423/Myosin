//
//  Analytics.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>

static NSString *workoutCompletionKey = @"workoutCompletionKey";
static NSString *workoutEnergyRateKey = @"workoutEnergyRateKey";

@interface Analytics : PFObject

@property (nonatomic, assign) BOOL workoutCompletion;
@property (nonatomic, assign) NSInteger *workoutEnergyRate;

@end
