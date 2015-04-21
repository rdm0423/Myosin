//
//  Reminder.m
//  cardalot
//
//  Created by sombra on 2015-03-16.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import "Reminder.h"
#import "RemindersController.h"

static NSString * const dateKey = @"date";
static NSString * const frequencyKey = @"frequency";

@implementation Reminder

- (NSDictionary *)reminderDictionary {
    NSMutableDictionary *reminderDictionary = [[NSMutableDictionary alloc] init];
    
    if (self.date) {
        [reminderDictionary setValue:self.date forKey:dateKey];
    }
    if (self.frequency) {
        [reminderDictionary setValue:self.frequency forKey:frequencyKey];
    }
    return reminderDictionary;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _date = dictionary[dateKey];
        _frequency = dictionary[frequencyKey];
    }
    return self;
}

- (void)save {
    [[RemindersController sharedInstance] save];
}

@end
