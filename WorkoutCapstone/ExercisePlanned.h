//
//  ExercisePlanned.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/18/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercise, Workout;

@interface ExercisePlanned : NSManagedObject

@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * dateCompleted;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) Exercise *exercise;
@property (nonatomic, retain) Workout *workout;

@end
