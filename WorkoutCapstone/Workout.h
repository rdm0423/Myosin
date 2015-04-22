//
//  Workout.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/18/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercise, ExercisePlanned;

@interface Workout : NSManagedObject

@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * focusArea;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSNumber * restTime;
@property (nonatomic, retain) NSNumber * sets;
@property (nonatomic, retain) NSOrderedSet *plannedExercises;
@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)addPlannedExercisesObject:(ExercisePlanned *)value;
- (void)removePlannedExercisesObject:(ExercisePlanned *)value;
- (void)addPlannedExercises:(NSSet *)values;
- (void)removePlannedExercises:(NSSet *)values;

- (void)insertObject:(Exercise *)value inExercisesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromExercisesAtIndex:(NSUInteger)idx;
- (void)insertExercises:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeExercisesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInExercisesAtIndex:(NSUInteger)idx withObject:(Exercise *)value;
- (void)replaceExercisesAtIndexes:(NSIndexSet *)indexes withExercises:(NSArray *)values;
- (void)addExercisesObject:(Exercise *)value;
- (void)removeExercisesObject:(Exercise *)value;
- (void)addExercises:(NSOrderedSet *)values;
- (void)removeExercises:(NSOrderedSet *)values;
@end
