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


@end

@implementation HomePageDatesource

- (void)createCells {


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
    
    // customize image
    cell.workoutImageView.image = [UIImage imageNamed:@"tempblue"];
    cell.workoutImageView.layer.cornerRadius = 8.0f;
    cell.workoutImageView.clipsToBounds = YES;
    
    Workout *workout = [WorkoutController sharedInstance].workouts[indexPath.row];
    
    cell.workoutNameLabel.text = workout.name;
    cell.focusAreaLabel.text = workout.focusArea;
//    cell.previousCompletedLabel.text = @"completed";
    
    return cell;
}

#pragma mark - sets the tableview links to ViewControllers
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSArray *)workoutArray {
    return @[@"Mike's Killer Biceps", @"Leg crunch", @"Cardio HIIT"];
}

#pragma mark - custom menu cell height
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (indexPath.row == 0) {
//        return 54;
//    } else {
//        return 54;
//    }
//}

@end
