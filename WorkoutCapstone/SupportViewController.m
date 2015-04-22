//
//  SupportViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/10/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "SupportViewController.h"
@import MessageUI;

@interface SupportViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation SupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Support";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 300, 80)];
    tempLabel.numberOfLines = 0;
    tempLabel.text = @"Let us know if you have any questions or suggestions.";
    
    
    // Sets email compose
    UIButton *composeEmailButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 350, 180, 80)];
    composeEmailButton.tintColor = [UIColor lightGrayColor];
    composeEmailButton.layer.borderWidth = 1.0;
    composeEmailButton.layer.cornerRadius = 3;
    composeEmailButton.layer.borderColor = [UIColor blueColor].CGColor;
    [composeEmailButton setTitle:@"Send feedback" forState:UIControlStateNormal];
    [composeEmailButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [composeEmailButton addTarget:self action:@selector(sendFeedbackEmail:) forControlEvents:UIControlEventTouchUpInside];
    [composeEmailButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [self.view addSubview:tempLabel];
    [self.view addSubview:composeEmailButton];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendFeedbackEmail:(id)sender {
    
    MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
    mailComposeViewController.mailComposeDelegate = self;
    [mailComposeViewController setToRecipients:@[@"fsboarder2003@icloud.com"]];
    [mailComposeViewController setSubject:@"Myosin App Feedback"];
    [mailComposeViewController.navigationBar setTintColor:[UIColor whiteColor]];
    
    if ([MFMailComposeViewController canSendMail]) {
        [self presentViewController:mailComposeViewController animated:YES completion:nil];
    }
}

// allows user to hit 'cancel' and exit
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)done {
    //    [self.drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
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
