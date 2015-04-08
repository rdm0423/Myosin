//
//  GuideStep.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/8/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercise;

@interface GuideStep : NSManagedObject

@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) Exercise *exercise;

@end
