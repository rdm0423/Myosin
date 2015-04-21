//
//  RemindersController.m
//  cardalot
//
//  Created by sombra on 2015-03-16.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import "RemindersController.h"
#import "Reminder.h"

static NSString * const reminderKey = @"reminder";

@interface RemindersController ()

@property (nonatomic, strong) NSArray *reminders;

@end

@implementation RemindersController

+ (RemindersController *)sharedInstance {
    static RemindersController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RemindersController alloc] init];
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)setReminders:(NSArray *)reminders {
    _reminders = reminders;
    [self save];
}

- (void)addReminder:(Reminder *)reminder {
    if (!reminder) {
        return;
    }
    
    NSMutableArray *mutableReminders = [[NSMutableArray alloc] initWithArray:self.reminders];
    [mutableReminders addObject:reminder];
    
    self.reminders = mutableReminders;
}

- (void)removeReminder:(Reminder *)reminder {
    if (!reminder) {
        return;
    }
    NSMutableArray *mutableReminders = [[NSMutableArray alloc] initWithArray:self.reminders];
    [mutableReminders removeObject:reminder];
    
    self.reminders = mutableReminders;
}

- (void)loadFromDefaults {
    NSArray *reminderDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:reminderKey];
    
    NSMutableArray *reminders = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in reminderDictionaries) {
        [reminders addObject:[[Reminder alloc] initWithDictionary:dictionary]];
    }
    self.reminders = reminders;
}

- (void)save {
    NSMutableArray *reminderDictionaries = [[NSMutableArray alloc] init];
    for (Reminder *reminder in self.reminders) {
        [reminderDictionaries addObject:[reminder reminderDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:reminderDictionaries forKey:reminderKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
