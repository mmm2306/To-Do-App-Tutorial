//
//  Task.m
//  To Do
//
//  Created by MAC on 23.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import "Task.h"

@implementation Task

-(id)initWithData:(NSDictionary *) data{
    
    self = [super init];
    
    if (self) {
        self.title = data[TASK_TITLE];
        self.taskDescription = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.isCompleted = [data[TASK_COMPLETION] boolValue];
        
        
    }
    return self;
}

-(id)init{
    self = [self initWithData:nil];
    
    return self;
}


@end
