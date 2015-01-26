//
//  AddTaskViewController.h
//  To Do
//
//  Created by MAC on 21.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol AddTaskViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAddTask:(Task*)task;

@end

@interface AddTaskViewController : UIViewController

@property (weak,nonatomic) id <AddTaskViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

-(IBAction)addTaskButtonPressed:(id)sender;
-(IBAction)cancelTaskButtonPressed:(id)sender;

@end
