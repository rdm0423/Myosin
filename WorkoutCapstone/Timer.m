//
//  Timer.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/15/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "Timer.h"

NSString * const TimerCompleteNotification = @"TimerComplete";
NSString * const SecondTickNotification = @"SecondTick";

@interface Timer ()

@property (nonatomic, assign) BOOL isOn;

@end

@implementation Timer

+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
    });
    return sharedInstance;
    
}

- (void)startTimer {
    
    self.isOn = YES;
    [self isActive];
    
    [self startAlertCountdown];
}

- (void)cancelTimer {
    self.isOn = NO;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(decreaseSecond) object:nil];
}

- (void)endTimer {
    self.isOn = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotification object:nil userInfo:nil];
}

- (void)decreaseSecond {
    
    if (self.seconds > 0) {
        self.seconds--;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil userInfo:nil];
    }
    if (self.minutes > 0) {
        if (self.seconds == 0) {
            self.seconds = 59;
            self.minutes--;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil userInfo:nil];
        
    } else {
        if (self.seconds == 0) {
            [self endTimer];
        }
    }
    
}

- (void)isActive {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    if (self.isOn == YES) {
        [self decreaseSecond];
        [self performSelector:@selector(isActive) withObject:nil afterDelay:1.0];
    }
}

- (void)startAlertCountdown {
    
    NSInteger currentMinutes = (self.minutes) * 60;
    NSInteger currentSeconds = self.seconds;
    NSInteger fireSeconds = currentMinutes + currentSeconds;
    
    UILocalNotification *localNotification = [UILocalNotification new];
    NSDate *fireDate = [[NSDate date] dateByAddingTimeInterval:fireSeconds];
    localNotification.fireDate = fireDate;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
}


@end
