//
//  ActivityTableViewController.m
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityDetailViewController.h"

@interface ActivityTableViewController ()

@end

@implementation ActivityTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mobs = [Mobs sharedInstance];
}




// UITableViewDataSource protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mobs.all.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Mob *mob = [self.mobs mobAtIndex:[indexPath row]];
    NSLog(@"%i %@", [indexPath row], mob);

    
    NSString *cellID = @"activityTableViewCell";
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID andMob:mob andHeight:tableView.rowHeight];
    }
    
    return cell;
}




// UITableViewDelegate protocol
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %i", [indexPath row]);
    NSLog(@"%@", tableView.dataSource);
    
    UIStoryboard *storyboard = self.storyboard;
    ActivityDetailViewController *activityDetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"activityDetailViewController"];
    
    activityDetailViewController.mob = [self.mobs mobAtIndex:[indexPath row]];
    activityDetailViewController.title = activityDetailViewController.mob.name;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:nil
                                                                  action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [self.navigationController pushViewController:activityDetailViewController animated:YES];
}

@end
