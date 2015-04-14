//
//  ExercisePlanned.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/8/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ExercisePlanned : NSManagedObject

@property (nonatomic, retain) NSDate * dateCompleted;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSManagedObject *exercise;
@property (nonatomic, retain) NSManagedObject *workout;

@end
