//
//  ExerciseGetterController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/8/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ImportWorkoutsToCoreDataController.h"
#import "Exercise.h"
#import "Stack.h"

@implementation ImportWorkoutsToCoreDataController


+ (ImportWorkoutsToCoreDataController *)sharedInstance {
    static ImportWorkoutsToCoreDataController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ImportWorkoutsToCoreDataController new];
        
        [sharedInstance checkForImportedExercises];
    });
    return sharedInstance;
    
}

- (void)checkForImportedExercises {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL imported = [userDefaults boolForKey:@"imported"];
    if (!imported) {
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"exercises" withExtension:@"json"];
        [self importExercisesFromFileURL:url];
    }
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Exercise"];
    
    NSError *error;
    
    NSArray *allExercises = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
}

-(void)importExercisesFromFileURL:(NSURL *)url {
    
    NSError *error;
    
    NSArray *allExercises = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"ERROR!");
    }
    
    for (NSDictionary *dictionary in allExercises) {
        Exercise *exercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        
        NSDictionary *exerciseDetails = [dictionary objectForKey:dictionary.allKeys[0]];
        
        exercise.name = dictionary.allKeys[0];
        exercise.muscleWorked = exerciseDetails[MuscleWorkedKey];
        exercise.picture = exerciseDetails[PictureKey];
        exercise.level = exerciseDetails[LevelKey];
        //TODO: Handle guide
//        exercise.guide = exerciseDetails[GuideKey];
        exercise.equipment = exerciseDetails[EquipmentKey];
        exercise.type = exerciseDetails[TypeKey];
        exercise.mechanicsType = exerciseDetails[MechanicsTypeKey];
        exercise.link = exerciseDetails[LinkKey];
        
    }
    
    [[Stack sharedInstance].managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Save error!");
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"imported"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
