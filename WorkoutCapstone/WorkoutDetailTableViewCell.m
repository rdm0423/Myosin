//
//  WorkoutDetailTableViewCell.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "WorkoutDetailTableViewCell.h"

@implementation WorkoutDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // create label
        self.detailWorkoutLabel = [UILabel new];
        
        // customize Label
        self.detailWorkoutLabel.text = @"Workout Title to Go Here";
        [self.detailWorkoutLabel setFont:[UIFont boldSystemFontOfSize:26.0]];
        [self.detailWorkoutLabel setTextAlignment:NSTextAlignmentCenter];
        [self.detailWorkoutLabel setTextColor:[UIColor blackColor]];
        [self.detailWorkoutLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // add to view
        [self.contentView addSubview:self.detailWorkoutLabel];
        
        // AUTOLAYOUT
        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_detailWorkoutLabel);
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-60-[_detailWorkoutLabel(>=250)]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
        [self.contentView addConstraints:constraints];
        NSArray *constraintsVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_detailWorkoutLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary];
        [self.contentView addConstraints:constraintsVertical];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
