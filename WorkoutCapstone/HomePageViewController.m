//
//  HomePageViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageDatesource.h"
#import "HomePageTableViewCell.h"

@interface HomePageViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) HomePageDatesource *datasource;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;


@property (weak, nonatomic) IBOutlet UIButton *createWorkoutViewButton;
@property (weak, nonatomic) IBOutlet UIButton *performanceViewButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsViewButton;



@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"Myosin";
    // Parse
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    // Tableview
//    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.datasource = [HomePageDatesource new];
    self.tableview.dataSource = self.datasource;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

- (IBAction)workoutTapped:(id)sender {
    
}

- (IBAction)createWorkoutButtonPressed:(id)sender {
    
}

- (IBAction)performanceButtonPressed:(id)sender {
    
}

- (IBAction)settingsButtonPressed:(id)sender {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

// toolbar methods
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
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
