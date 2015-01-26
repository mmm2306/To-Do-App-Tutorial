//
//  ViewController.h
//  To Do
//
//  Created by MAC on 21.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"

@interface ViewController : UIViewController <AddTaskViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *taskObjects;


-(IBAction)reorderBarButtonItemPressed:(id)sender;
-(IBAction)addBarButtonItemPressed:(id)sender;
@end

