//
//  Task.h
//  To Do
//
//  Created by MAC on 23.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *taskDescription;
@property (strong,nonatomic) NSDate *date;
@property (nonatomic) BOOL isCompleted;

-(id)initWithData:(NSDictionary *) data;


@end
