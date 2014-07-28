//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Efrén Reyes Torres on 7/28/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *todos;
@property (strong, nonatomic) IBOutlet UITableView *todoTableView;
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

- (IBAction)onAddButtonPressed:(id)sender {
    [self.todos addObject:self.textField.text];
    [self.todoTableView reloadData];
    self.textField.text = @"";
    [self.view endEditing:YES];
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"somethingUsefulID"];
    cell.textLabel.text = [self.todos objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row selected: %d", indexPath.row);

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
}

@end
