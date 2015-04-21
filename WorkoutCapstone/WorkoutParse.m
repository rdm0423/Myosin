//
//  WorkoutParse.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/18/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "WorkoutParse.h"

@implementation WorkoutParse

@dynamic name;
@dynamic sets;
@dynamic reps;
@dynamic focusArea;
@dynamic restTime;
@dynamic note;
@dynamic completed;
@dynamic date;
@dynamic exercises;
@dynamic plannedExercises;

+(NSString *)parseClassName
{
    return @"Workout";
}

+(void)load
{
    [self registerSubclass];
}

@end
