//
//  WorkoutParse.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/18/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Parse/Parse.h>
#import "Exercise.h"

@interface WorkoutParse : PFObject <PFSubclassing>

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * sets;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSString * focusArea;
@property (nonatomic, retain) NSNumber * restTime;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Exercise *exercises;
@property (nonatomic, retain) NSSet *plannedExercises;

@end
