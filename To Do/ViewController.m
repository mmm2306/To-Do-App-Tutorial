//
//  ViewController.m
//  To Do
//
//  Created by MAC on 21.01.2015.
//  Copyright (c) 2015 Mihai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSMutableArray *)taskobjects{
    if (!_taskObjects) {
        _taskObjects = [[NSMutableArray alloc] init];
    }
    
    return _taskObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSArray *taskAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY];
    
    for (NSDictionary *dictionary in taskAsPropertyLists) {
        Task *taskObject = [self taskObjectForDictionary:dictionary];
        [self.taskObjects addObject:taskObject];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController isKindOfClass:[AddTaskViewController class]]) {
        
        AddTaskViewController *addTaskViewController = segue.destinationViewController;
        addTaskViewController.delegate = self;
    }
}

-(IBAction)reorderBarButtonItemPressed:(id)sender{
    
}
-(IBAction)addBarButtonItemPressed:(id)sender{
    
    [self performSegueWithIdentifier:@"toAddTaskViewControllerSegue" sender:nil];
    
}

-(void)didAddTask:(Task *)task{
    
    [self.taskObjects addObject:task];
    
    
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY] mutableCopy];
    
    if (!taskObjectsAsPropertyLists) {
        taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    }
    
    [taskObjectsAsPropertyLists addObject:[self taskObjectAsAPropertyList:task]];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

-(void)didCancel{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helper Methods

-(NSDictionary *)taskObjectAsAPropertyList:(Task *)taskObject{
    
    NSDictionary *dictionary = @{TASK_TITLE : taskObject.title, TASK_DESCRIPTION : taskObject.taskDescription, TASK_DATE : taskObject.date, TASK_COMPLETION : @(taskObject.isCompleted)};
    
                                 
    return dictionary;
}

-(Task *)taskObjectForDictionary:(NSDictionary *)dictionary{
    Task *taskObject = [[Task alloc] initWithData:dictionary];
    return taskObject;
}

#pragma mark - UITableViewDatasSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.taskObjects count];
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Configure the cell
    Task *task = self.taskObjects[indexPath.row];
    cell.textLabel.text = task.title;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:task.date];
    cell.detailTextLabel.text = stringFromDate;
    
    return cell;
}

@end


