//
//  AddTaskViewController.m
//  To Do
//
//  Created by MAC on 21.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Task*)returnNewTaskObject{
    Task *task = [[Task alloc] init];
    task.title = self.textField.text;
    task.taskDescription = self.textView.text;
    task.date = self.datePicker.date;
    task.isCompleted = NO;
    
    return task;
}

-(IBAction)addTaskButtonPressed:(id)sender{
    [self.delegate didAddTask:[self returnNewTaskObject]];
}


-(IBAction)cancelTaskButtonPressed:(id)sender{
    [self.delegate didCancel];
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
