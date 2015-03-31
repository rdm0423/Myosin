//
//  MenuButtonsTableViewCell.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "MenuButtonsTableViewCell.h"

@implementation MenuButtonsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // create label
        self.createWorkoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.performanceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        // create buttons
        self.createWorkoutLabel = [UILabel new];
        self.performanceStatsLabel = [UILabel new];
        self.settingLabel = [UILabel new];
        
        // add images to buttons
        UIImage *addWorkoutImage = [UIImage imageNamed:@"add"];
        UIImage *performanceImage = [UIImage imageNamed:@"stats"];
        UIImage *settingsImage = [UIImage imageNamed:@"settings"];
        
        // customize Buttons
        [self.createWorkoutButton setImage:addWorkoutImage forState:UIControlStateNormal];
//        [self.createWorkoutButton addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        [self.performanceButton setImage:performanceImage forState:UIControlStateNormal];
//        [self.performanceButton addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        [self.settingsButton setImage:settingsImage forState:UIControlStateNormal];
//        [self.settingsButton addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        
        // customize Label
        self.createWorkoutLabel.text = @"Create Workout";
        [self.createWorkoutLabel setFont:[UIFont boldSystemFontOfSize:10.0]];
        [self.createWorkoutLabel setTextAlignment:NSTextAlignmentCenter];
        [self.createWorkoutLabel setTextColor:[UIColor blackColor]];
        [self.createWorkoutLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        self.performanceStatsLabel.text = @"Performance";
        [self.performanceStatsLabel setFont:[UIFont boldSystemFontOfSize:10.0]];
        [self.performanceStatsLabel setTextAlignment:NSTextAlignmentCenter];
        [self.performanceStatsLabel setTextColor:[UIColor blackColor]];
        [self.performanceStatsLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        self.settingLabel.text = @"Settings";
        [self.settingLabel setFont:[UIFont boldSystemFontOfSize:10.0]];
        [self.settingLabel setTextAlignment:NSTextAlignmentCenter];
        [self.settingLabel setTextColor:[UIColor blackColor]];
        [self.settingLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // add to view
        [self.contentView addSubview:self.createWorkoutButton];
        [self.contentView addSubview:self.performanceButton];
        [self.contentView addSubview:self.settingsButton];
        
        [self.contentView addSubview:self.createWorkoutLabel];
        [self.contentView addSubview:self.performanceStatsLabel];
        [self.contentView addSubview:self.settingLabel];
        
        
        
        // AUTOLAYOUT
        

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
