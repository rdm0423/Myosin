//
//  SettingsViewController.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableViewCell *advancedSettingsCell;
@property (nonatomic, strong) UITableViewCell *supportCell;
@property (nonatomic, strong) UITableViewCell *legalCell;

@property (nonatomic, strong) UITableViewCell *reminderCell;
@property (nonatomic, strong) UITableViewCell *howToUseCell;
@property (nonatomic, strong) UITableViewCell *versionCell;

@property (nonatomic, strong) UILabel *versionLabel;

@end
