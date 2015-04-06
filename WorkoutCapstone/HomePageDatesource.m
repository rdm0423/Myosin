//
//  HomePageDatesource.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "HomePageDatesource.h"
#import "HomePageTableViewCell.h"

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
# warning set to auto count based on workouts
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self workoutArray].count;
}

# warning get right array form for getting in the workout information
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomePageTableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"homeCell"];
    cell.workoutImageView.image = [UIImage imageNamed:@""];
    cell.workoutNameLabel.text = [self workoutArray][indexPath.row];
    cell.focusAreaLabel.text = [self workoutArray][indexPath.row];
    cell.previousCompletedLabel.text = [self workoutArray][indexPath.row];
    
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
