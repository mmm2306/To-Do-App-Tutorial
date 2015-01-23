//
//  ViewController.h
//  To Do
//
//  Created by MAC on 21.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(IBAction)reorderBarButtonItemPressed:(id)sender;
-(IBAction)addBarButtonItemPressed:(id)sender;
@end

