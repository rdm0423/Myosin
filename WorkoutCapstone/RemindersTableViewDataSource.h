//
//  RemindersTableViewDataSource.h
//  cardalot
//
//  Created by sombra on 2015-03-14.
//  Copyright (c) 2015 Jason Choi. All rights reserved.
//

@import UIKit;

@interface RemindersTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

- (void)registerTableView:(UITableView *)tableView;

@end
