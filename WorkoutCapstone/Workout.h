//
//  Workout.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/8/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ExercisePlanned;

@interface Workout : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * sets;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSString * focusArea;
@property (nonatomic, retain) NSNumber * restTime;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *plannedExercises;
@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)addPlannedExercisesObject:(ExercisePlanned *)value;
- (void)removePlannedExercisesObject:(ExercisePlanned *)value;
- (void)addPlannedExercises:(NSSet *)values;
- (void)removePlannedExercises:(NSSet *)values;

@end
