//
//  Timer.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/15/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const TimerCompleteNotification;
extern NSString * const SecondTickNotification;

@interface Timer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+ (Timer *)sharedInstance;
- (void)startTimer;
- (void)cancelTimer;

@end
