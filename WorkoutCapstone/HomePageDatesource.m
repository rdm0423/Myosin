//
//  HomePageDatesource.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "HomePageDatesource.h"
#import "HomePageTableViewCell.h"
#import "WorkoutController.h"

//static NSString * const CellID = @"cell";

@interface HomePageDatesource ()

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSDictionary *focusAreaImageArray;

@end

@implementation HomePageDatesource

-(instancetype)init {
    self = [super init];
    if (self) {
        self.focusAreaImageArray = @{
                                     @"Back": @"back",
                                     @"Bicep": @"bicep",
                                     @"Cardio": @"cardio",
                                     @"Chest": @"chest",
                                     @"Core": @"core",
                                     @"Legs": @"legs",
                                     @"Shoulder": @"shoulders",
                                     @"Tricep": @"tricep",
                                     @"Upper Body": @"upperBody"
                                     };
    }
    return self;
}

- (void)registerTableView:(UITableView *)tableView {
    self.tableview = tableView;
    [tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homeCell"];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [WorkoutController sharedInstance].workouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];

    Workout *workout = [WorkoutController sharedInstance].workouts[indexPath.row];
    // customize image
    cell.workoutImageView.image = [UIImage imageNamed:self.focusAreaImageArray[workout.focusArea]];
    cell.workoutImageView.layer.cornerRadius = 8.0f;
    cell.workoutImageView.clipsToBounds = YES;
    
    cell.workoutNameLabel.text = workout.name;
    cell.focusAreaLabel.text = [NSString stringWithFormat:@"Focus Area:  %@", workout.focusArea];
    
//    cell.previousCompletedLabel.text = @"completed";
    
    return cell;
}

#pragma Mark - swipe to delete Methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    [self setEditing:YES animated:YES];
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        
//        [tableView reloadData];
//    }
}

#pragma mark - sets the tableview links to ViewControllers
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
