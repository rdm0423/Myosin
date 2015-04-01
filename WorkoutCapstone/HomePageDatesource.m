//
//  HomePageDatesource.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "HomePageDatesource.h"

@interface HomePageDatesource ()

@property (nonatomic, strong) TitleTableViewCell *titleCell;
@property (nonatomic, strong) WorkoutTableViewCell *workoutCell;
@property (nonatomic, strong) WorkoutDetailTableViewCell *workoutDetailCell;
@property (nonatomic, strong) MenuButtonsTableViewCell *menuButtonsCell;
@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation HomePageDatesource

- (void)createCells {
    self.cells = [[NSMutableArray alloc] init];
    
    self.titleCell = [[TitleTableViewCell alloc] init];
    [self.cells addObject:self.titleCell];
    
    self.workoutCell = [WorkoutTableViewCell new];
    [self.cells addObject:self.workoutCell];
    
    self.workoutDetailCell = [WorkoutDetailTableViewCell new];
    [self.cells addObject:self.workoutDetailCell];
    
    self.menuButtonsCell = [MenuButtonsTableViewCell new];
    [self.cells addObject:self.menuButtonsCell];
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cells[indexPath.row];
}

#pragma mark - sets the tableview links to ViewControllers
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma mark - custom menu cell height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 54;
    } else {
        return 54;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
