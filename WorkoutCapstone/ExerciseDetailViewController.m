//
//  ExerciseDetailViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/17/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ExerciseDetailViewController.h"
#import "GuideStep.h"

@interface ExerciseDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *guideLabel;
@property (weak, nonatomic) IBOutlet UIButton *linkButton;
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImage;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mechanicsLabel;
@property (weak, nonatomic) IBOutlet UILabel *equipmentLabel;
@property (nonatomic, weak) UIScrollView *scrollView;


@end

@implementation ExerciseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    int stepCount = 1;
    
    NSString *guideStepsText = [NSString stringWithFormat:@"Instructions: \n%d. %@",stepCount,[[self.exercise.guideSteps objectAtIndex:0] details]];
    
    for (GuideStep *step in self.exercise.guideSteps) {
        stepCount++;
        guideStepsText = [guideStepsText stringByAppendingString:[NSString stringWithFormat:@"\n%d. %@",stepCount,step.details]];
    }
    
    self.typeLabel.text = self.exercise.type;
    self.mechanicsLabel.text = self.exercise.mechanicsType;
    self.equipmentLabel.text = self.exercise.equipment;
    self.guideLabel.text = guideStepsText;

    NSURL *pictureURL = [NSURL URLWithString:self.exercise.picture];
    [[[NSURLSession sharedSession] dataTaskWithURL:pictureURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        UIImage *downloadImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:pictureURL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.exerciseImage.image = downloadImage;
        });
    }] resume];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
