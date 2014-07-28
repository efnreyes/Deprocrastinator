//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Efrén Reyes Torres on 7/28/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *todos;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.todos = [NSMutableArray arrayWithObjects:
                  @"TODO 1",
                  @"TODO 2",
                  @"TODO 3",
                  @"TODO 4",
                  nil];
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"somethingUsefulID"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];
    return cell;
}

@end
