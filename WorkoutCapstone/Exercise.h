//
//  Exercise.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>

static NSString *exerciseNameKey = @"exerciseNameKey";
static NSString *exerciseWeightKey = @"exerciseWeightKey";
static NSString *exerciseTimeKey = @"exerciseTimeKey";
static NSString *exerciseDetailsKey = @"exerciseDetailsKey";

@interface Exercise : PFObject

@property (nonatomic, strong) NSString *exerciseName;
@property (nonatomic, strong) NSString *exerciseWeight;
@property (nonatomic, strong) NSString *exerciseTime;
@property (nonatomic, strong) NSString *exerciseDetails;


@end
