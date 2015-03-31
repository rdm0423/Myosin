//
//  TitleTableViewCell.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // create label
        self.workoutTitleLabel = [UILabel new];
        
        // customize Label
        self.workoutTitleLabel.text = @"Workout Title to Go Here";
        [self.workoutTitleLabel setFont:[UIFont boldSystemFontOfSize:26.0]];
        [self.workoutTitleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.workoutTitleLabel setTextColor:[UIColor blackColor]];
        [self.workoutTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // add to view
        [self.contentView addSubview:self.workoutTitleLabel];
        
        // AUTOLAYOUT
        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_workoutTitleLabel);
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-60-[_workoutTitleLabel(>=250)]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
        [self.contentView addConstraints:constraints];
        NSArray *constraintsVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_workoutTitleLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
        [self.contentView addConstraints:constraintsVertical];
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
