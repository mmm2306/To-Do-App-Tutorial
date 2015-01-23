//
//  DetailTaskViewController.h
//  To Do
//
//  Created by MAC on 21.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTaskViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

-(IBAction)editBarButtonPressed:(id)sender;

@end
