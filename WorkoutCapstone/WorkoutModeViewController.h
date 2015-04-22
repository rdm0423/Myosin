//
//  WorkoutModeViewController.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/3/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workout.h"
@import CoreData;

@interface WorkoutModeViewController : UIViewController

@property (nonatomic, strong) Workout *workout;

@end
