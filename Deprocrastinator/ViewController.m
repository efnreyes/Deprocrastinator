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
@property (strong, nonatomic) IBOutlet UIButton *editButton;
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
    self.todoTableView.allowsSelectionDuringEditing = YES;
}

- (IBAction)onAddButtonPressed:(id)sender {
    if (![self.textField.text isEqualToString:@""]) {
        [self.todos addObject:self.textField.text];
        [self.todoTableView reloadData];
        self.textField.text = @"";
    }
    [self.view endEditing:YES];
}

- (IBAction)onEditButtonPressed:(id)sender {
    NSLog(@"Edit button action");

    if ([self.editButton.titleLabel.text isEqualToString:@"Edit"]) {
        [sender setTitle: @"Done" forState: UIControlStateNormal];
        [self.todoTableView setEditing:YES animated:YES];
    } else {
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        self.editing = NO;
        [self.todoTableView setEditing:NO animated:YES];
    }

}

-(IBAction)onSwipe:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint swipeLocation = [gestureRecognizer locationInView:self.todoTableView];
        NSIndexPath *swipedIndexPath = [self.todoTableView indexPathForRowAtPoint:swipeLocation];
        UITableViewCell* swipedCell = [self.todoTableView cellForRowAtIndexPath:swipedIndexPath];
        if ([swipedCell.textLabel.textColor isEqual:[UIColor blackColor]]) {
            NSLog(@"Black color");
            swipedCell.textLabel.textColor = [UIColor greenColor];
        } else if ([swipedCell.textLabel.textColor isEqual:[UIColor greenColor]]) {
            NSLog(@"Green color");
            swipedCell.textLabel.textColor = [UIColor yellowColor];
        } else if ([swipedCell.textLabel.textColor isEqual:[UIColor yellowColor]]) {
            NSLog(@"Yellow color");
            swipedCell.textLabel.textColor = [UIColor redColor];
        } else if ([swipedCell.textLabel.textColor isEqual:[UIColor redColor]]) {
            NSLog(@"Red color");
            swipedCell.textLabel.textColor = [UIColor blackColor];
        }
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.todos removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    if ([self.editButton.titleLabel.text isEqualToString:@"Done"]) {
        NSLog(@"Done is selected");
        [self.todos removeObjectAtIndex:indexPath.row];
        [self.todoTableView reloadData];
    } else {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.textColor = [UIColor greenColor];
    }
}

#pragma mark Reorder
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *stringToMove = self.todos[sourceIndexPath.row];
    [self.todos removeObjectAtIndex:sourceIndexPath.row];
    [self.todos insertObject:stringToMove atIndex:destinationIndexPath.row];
}

@end
