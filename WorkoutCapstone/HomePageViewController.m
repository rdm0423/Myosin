//
//  HomePageViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/31/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Myosin";
    
    // Create tableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    // Disable/Enable selection cell highlight
    self.tableView.allowsSelection = YES;
    
    // Removes seperator lines
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Datasource
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Background Color of TableView
    self.tableView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1];
    
    
    // Add to view
    [self.view addSubview:self.tableView];
    
    
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
