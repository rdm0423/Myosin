//
//  RemindersController.h
//  cardalot
//
//  Created by sombra on 2015-03-16.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Reminder;

@interface RemindersController : NSObject

@property (nonatomic, strong, readonly) NSArray *reminders;

+ (RemindersController *)sharedInstance;

- (void)addReminder:(Reminder *)reminder;
- (void)removeReminder:(Reminder *)reminder;

- (void)save;

@end
