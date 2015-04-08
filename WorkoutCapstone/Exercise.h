//
//  Exercise.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/8/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

static NSString * const NameKey = @"";
static NSString * const MuscleWorkedKey = @"Main Muscle Worked";
static NSString * const LevelKey = @"Level";
static NSString * const PictureKey = @"pic_right";
static NSString * const MechanicsTypeKey = @"Mechanics Type";
static NSString * const EquipmentKey = @"Equipment";
static NSString * const LinkKey = @"link";
static NSString * const TypeKey = @"Type";
static NSString * const GuideKey = @"guide";

@class ExercisePlanned;

@interface Exercise : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * muscleWorked;
@property (nonatomic, retain) NSString * level;
@property (nonatomic, retain) NSString * equipment;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * guide;
@property (nonatomic, retain) NSString * mechanicsType;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSSet *guideSteps;
@property (nonatomic, retain) ExercisePlanned *completedExercises;
@end

@interface Exercise (CoreDataGeneratedAccessors)

- (void)addGuideStepsObject:(NSManagedObject *)value;
- (void)removeGuideStepsObject:(NSManagedObject *)value;
- (void)addGuideSteps:(NSSet *)values;
- (void)removeGuideSteps:(NSSet *)values;

@end
