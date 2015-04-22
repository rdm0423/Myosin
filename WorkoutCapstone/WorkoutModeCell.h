//
//  WorkoutModeCell.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/22/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutModeCell : UITableViewCell

@property (nonatomic,assign) BOOL completed;
@property (weak, nonatomic) IBOutlet UILabel *workoutNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *workoutDetailLabel;

@end
