//
//  CustomDatePickerView.m
//  CustomDatePicker
//
//  Created by sombra on 2015-03-13.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import "CustomDatePickerView.h"
#import "RemindersController.h"
#import "Reminder.h"

typedef enum : NSInteger {
    HourPicker = 0,
    MinutePicker = 1,
    MeridiemPicker = 2,
    FrequencyPicker = 3
} DatePickerType;

@interface CustomDatePickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIButton *setDateButton;
@property (strong, nonatomic) UIButton *cancelButton;

@property (strong, nonatomic) UILabel *reminderLabel;

@property (strong, nonatomic) UIView *separatorViewOne;
@property (strong, nonatomic) UIView *separatorViewTwo;
@property (strong, nonatomic) UIView *separatorViewThree;

@property (strong, nonatomic) UIPickerView *pickerView;

@property (strong, nonatomic) NSDate *date;

@property (strong, nonatomic) NSArray *frequencyTitles;
@property (strong, nonatomic) NSArray *meridiems;

@property (strong, nonatomic) NSString *frequency;
@property (strong, nonatomic) NSString *meridiem;

@end

@implementation CustomDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frequency = @"Daily";
        self.meridiem = @"AM";
        
        self.backgroundColor = [UIColor darkGrayColor];
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1.0;
        
        self.reminderLabel = [[UILabel alloc] initWithFrame:CGRectMake(46, 9, 188, 21)];
        self.reminderLabel.text =[NSString stringWithFormat:@"%@ at %@", self.frequency, [NSDateFormatter localizedStringFromDate:[self selectedTime] dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle]];
        self.reminderLabel.textAlignment = NSTextAlignmentCenter;
        self.reminderLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.reminderLabel];
        
        self.separatorViewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 35, 280, 1)];
        self.separatorViewOne.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.separatorViewOne];
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 36, 280, 162)];
        [self addSubview:self.pickerView];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        self.separatorViewTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 198, 280, 1)];
        self.separatorViewTwo.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.separatorViewTwo];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(8, 210, 132, 30);
        [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.7] forState:UIControlStateHighlighted];
        [self.cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        self.separatorViewThree = [[UIView alloc] initWithFrame:CGRectMake(140, 199, 1, 50)];
        self.separatorViewThree.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.separatorViewThree];
        
        self.setDateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.setDateButton.frame = CGRectMake(150, 210, 122, 30);
        [self.setDateButton setTitle:@"Confirm" forState:UIControlStateNormal];
        [self.setDateButton setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.7] forState:UIControlStateHighlighted];
        [self.setDateButton addTarget:self action:@selector(setDateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.setDateButton];
        
        for (NSUInteger i = 0; i < 3; i++) {
            [self.pickerView selectRow:[self defaultRowValueForComponent:i] inComponent:i animated:NO];
        }
    }
    
    return self;
}

#pragma mark Custom getter

- (NSDate *)date {
    if (!_date) {
        _date = [NSDate date];
    }
    return _date;
}

- (NSArray *)frequencyTitles {
    return @[@"Daily", @"Weekly", @"Monthly"];
}

- (NSArray *)meridiems {
    return @[@"AM", @"PM"];
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == FrequencyPicker) {
        return 3;
    } else if (component == MeridiemPicker) {
        return 2;
    } else {
        return [self actualNumberOfRowsInComponent:component] * 200;
    }
}

- (NSInteger)actualNumberOfRowsInComponent:(NSInteger)component {
    NSInteger numberOfRows = 0;
    switch (component) {
        case HourPicker:
            numberOfRows = 12;
            break;
        case MinutePicker:
            numberOfRows = 60;
            break;
    }
    return numberOfRows;
}

- (NSInteger)defaultRowValueForComponent:(NSInteger)component {
    if (component == FrequencyPicker) {
        return 0;
    } else {
        return [self actualNumberOfRowsInComponent:component] * 100;
    }
}

#pragma mark UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat width = 0;
    switch (component) {
        case FrequencyPicker:
            width = 90;
            break;
        case HourPicker:
            width = 40;
            break;
        case MinutePicker:
            width = 40;
            break;
        case MeridiemPicker:
            width = 42;
            break;
    }
    
    return width;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == FrequencyPicker) {
        self.frequency = [self.frequencyTitles objectAtIndex:row];
    }
    if (component == MeridiemPicker) {
        self.meridiem = [self.meridiems objectAtIndex:row];
    }
    NSDate *selectedTime = [self selectedTime];
    self.reminderLabel.text = [NSString stringWithFormat:@"%@ at %@", self.frequency, [NSDateFormatter localizedStringFromDate:selectedTime dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle]];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = @"";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    switch (component) {
        case FrequencyPicker:
            title = [self.frequencyTitles objectAtIndex:row];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            break;
        case HourPicker:
            title = [NSString stringWithFormat:@"%02ld", row % [self actualNumberOfRowsInComponent:component] + 1];
            [paragraphStyle setAlignment:NSTextAlignmentRight];
            break;
        case MinutePicker:
            title = [NSString stringWithFormat:@"%02ld", row % [self actualNumberOfRowsInComponent:component]];
            [paragraphStyle setAlignment:NSTextAlignmentLeft];
            break;
        case MeridiemPicker:
            title = [self.meridiems objectAtIndex:row];
            [paragraphStyle setAlignment:NSTextAlignmentLeft];
    }
    
    return [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSParagraphStyleAttributeName: paragraphStyle}];
}

#pragma mark NSDate stuff
- (NSInteger)daysInMonthForDate:(NSDate *)date {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

- (NSDate *)selectedTime {
    NSInteger hour;
    if ([self.meridiem isEqualToString:@"AM"]) {
        hour = [[self pickerView:self.pickerView attributedTitleForRow:[self.pickerView selectedRowInComponent:HourPicker] forComponent:HourPicker].string integerValue];
        if (hour == 12) {
            hour = 0;
        }
    } else {
        hour = [[self pickerView:self.pickerView attributedTitleForRow:[self.pickerView selectedRowInComponent:HourPicker] forComponent:HourPicker].string integerValue] + 12;
        if (hour == 24) {
            hour = 12;
        }
    }
    NSInteger minute = [[self pickerView:self.pickerView attributedTitleForRow:[self.pickerView selectedRowInComponent:MinutePicker] forComponent:MinutePicker].string integerValue];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self.date];
    [comps setHour:hour];
    [comps setMinute:minute];
    NSDate *selectedTime = [calendar dateFromComponents:comps];
    return [[NSCalendar currentCalendar] dateBySettingHour:hour minute:minute second:0 ofDate:selectedTime options:0];
}

#pragma mark IBAction

- (IBAction)cancelButtonPressed:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        self.center = CGPointMake(self.center.x, self.center.y + 700);
    }];
}

- (IBAction)setDateButtonPressed:(id)sender {
    NSDate *selectedDate = [self selectedTime];
    Reminder *reminder = [[Reminder alloc] init];
    reminder.date = selectedDate;
    reminder.frequency = self.frequency;
    [[RemindersController sharedInstance] addReminder:reminder];
    [UIView animateWithDuration:1.0 animations:^{
        self.center = CGPointMake(self.center.x, self.center.y + 700);
    }];
    
    [self.tableView reloadData];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = @"Time to study!";
    localNotification.fireDate = selectedDate;
    localNotification.applicationIconBadgeNumber = 1;
    
    if ([self.frequency isEqualToString:@"Daily"]) {
        localNotification.repeatInterval = NSCalendarUnitDay;
    } else if ([self.frequency isEqualToString:@"Weekly"]) {
        localNotification.repeatInterval = NSCalendarUnitWeekOfYear;
    } else {
        localNotification.repeatInterval = NSCalendarUnitMonth;
    }
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
