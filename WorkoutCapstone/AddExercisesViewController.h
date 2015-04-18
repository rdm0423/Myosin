//
//  AddExercisesViewController.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/3/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workout.h"
@import CoreData;
@class Exercise;

static NSString *CellIdentifier = @"Cell";

@protocol ExerciseSelectedDelegate;

@interface AddExercisesViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) id<ExerciseSelectedDelegate> delegate;
@property (nonatomic, strong) Workout *workout;

@end

@protocol ExerciseSelectedDelegate <NSObject>

@optional

-(void)didSelectExercise:(Exercise *)exercise;

@end
