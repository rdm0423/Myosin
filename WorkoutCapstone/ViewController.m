//
//  ViewController.m
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 3/26/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ViewController.h"
#import "HomePageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // PARSE
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
