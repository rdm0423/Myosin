//
//  MenuButtonsTableViewCell.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuButtonsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *createWorkoutButton;
@property (nonatomic, strong) UIButton *performanceButton;
@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) UILabel *createWorkoutLabel;
@property (nonatomic, strong) UILabel *performanceStatsLabel;
@property (nonatomic, strong) UILabel *settingLabel;

@end
