//
//  Exercise.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/27/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

@dynamic exerciseName;
@dynamic exerciseWeight;
@dynamic exerciseTime;
@dynamic exerciseDetails;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}


@end
