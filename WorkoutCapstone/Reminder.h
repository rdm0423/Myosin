//
//  Reminder.h
//  cardalot
//
//  Created by sombra on 2015-03-16.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reminder : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *frequency;

- (NSDictionary *)reminderDictionary;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (void)save;

@end
