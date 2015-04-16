//
//  SettingsViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 4/1/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "SettingsViewController.h"
#import "LegalInformationViewController.h"
#import "SupportViewController.h"
#import "AdvancedSettingsViewController.h"
#import "FAQViewController.h"
#import "RemindersViewController.h"


@import WebKit;

@interface SettingsViewController () <UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIView *faqContainerView;

@end

static NSString * const circuitModeKey = @"circuitKey";

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Settings";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
#pragma mark - sets static settings cells
    self.advancedSettingsCell = [UITableViewCell new];
    self.advancedSettingsCell.textLabel.text = @"Advanced Settings";
    self.advancedSettingsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.circuitModeCell = [UITableViewCell new];
    self.circuitModeCell.textLabel.text = @"Circuit Mode";
    self.circuitModeCell.detailTextLabel.text = @"Do each exercise once as Set";
    UISwitch *toggle = [UISwitch new];
    [toggle addTarget:self action:@selector(circuitModeToggle) forControlEvents:UIControlEventValueChanged];
    BOOL circuitStyle = [[NSUserDefaults standardUserDefaults] boolForKey:circuitModeKey];
    [toggle setOn:circuitStyle];
    self.circuitModeCell.accessoryView = toggle;
    
    self.reminderCell = [UITableViewCell new];
    self.reminderCell.textLabel.text = @"Reminders";
    self.reminderCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.howToUseCell = [UITableViewCell new];
    self.howToUseCell.textLabel.text = @"FAQ";
    self.howToUseCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.supportCell = [UITableViewCell new];
    self.supportCell.textLabel.text = @"Support";
    self.supportCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.legalCell = [UITableViewCell new];
    self.legalCell.textLabel.text = @"Legal";
    self.legalCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.versionCell = [UITableViewCell new];
    self.versionLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.versionCell.contentView.bounds, 15, 0)];
    self.versionLabel.text = @"Version ";
    self.versionCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.versionCell addSubview:self.versionLabel];
    UILabel *versionNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    versionNumber.text = @"1.0";
    versionNumber.textColor = [UIColor lightGrayColor];
    self.versionCell.accessoryView = versionNumber;
    
    // Disable/Enable selection
    self.tableView.allowsSelection = YES;
    
    // Add to view
    [self.view addSubview:self.tableView];

    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch(section) {
        case 0:  return 3;  // section 0 has 2 rows
        case 1:  return 2;  // section 1 has 2 row
        case 2: return 2;  // section 2 has 2 row
        default: return 0;
    };
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
                case 0: return self.advancedSettingsCell;
                case 1: return self.circuitModeCell;
                case 2: return self.reminderCell;
            }
        case 1:
            switch(indexPath.row) {
                case 0: return self.howToUseCell;
                case 1: return self.supportCell;
            }
        case 2:
            switch (indexPath.row) {
                case 0: return self.legalCell;
                case 1: return self.versionCell;
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AdvancedSettingsViewController *advancedSettingVC = [AdvancedSettingsViewController new];
            UINavigationController *advancedSettingNavController = [[UINavigationController alloc] initWithRootViewController:advancedSettingVC];
            [self presentViewController:advancedSettingNavController animated:YES completion:nil];
        } else if (indexPath.row == 2) {
# warning code for toggle?
            
        } else if (indexPath.row == 3) {
            RemindersViewController *reminderVC = [RemindersViewController new];
            UINavigationController *reminderNavController = [[UINavigationController alloc] initWithRootViewController:reminderVC];
            [self presentViewController:reminderNavController animated:YES completion:nil];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            self.faqContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview:self.faqContainerView];
            WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 92)];
            NSString *htmlForView = [NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"FAQ" withExtension:@"html"] encoding:NSStringEncodingConversionAllowLossy error:nil];
            [webView loadHTMLString:htmlForView baseURL:[[NSBundle mainBundle] URLForResource:@"FAQ" withExtension:@"html"]];
            
            UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [dismissButton setImage:[UIImage imageNamed:@"deletecircle"] forState:UIControlStateNormal];
            dismissButton.frame = CGRectMake(CGRectGetMaxX(self.faqContainerView.frame) - 40, 32, 30, 30);
            [dismissButton addTarget:self action:@selector(dismissFAQView) forControlEvents:UIControlEventTouchUpInside];
            
            [self.faqContainerView addSubview:webView];
            [self.faqContainerView addSubview:dismissButton];
            
            
        } else if (indexPath.row == 1) {
            SupportViewController *supportVC = [SupportViewController new];
            UINavigationController *supportNavController = [[UINavigationController alloc] initWithRootViewController:supportVC];

            [self presentViewController:supportNavController animated:YES completion:nil];
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            LegalInformationViewController *legalVC = [LegalInformationViewController new];
            UINavigationController *legalNavController = [[UINavigationController alloc] initWithRootViewController:legalVC];

            [self presentViewController:legalNavController animated:YES completion:nil];
        }
    }
}

// Sets the section headings for each section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section) {
        case 0: return @"General";
        case 1: return @"Help";
        case 2: return @"About";
    }
    return nil;
}

- (void)circuitModeToggle {
    
    
}

- (void)dismissFAQView {
    [self.faqContainerView removeFromSuperview];
}


- (IBAction)cancelButton:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
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
