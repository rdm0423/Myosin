//
//  HomePageTableViewCell.h
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/6/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *workoutImageView;
@property (weak, nonatomic) IBOutlet UILabel *workoutNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *focusAreaLabel;
@property (weak, nonatomic) IBOutlet UILabel *previousCompletedLabel;

@end
