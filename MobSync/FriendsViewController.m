//
//  FriendsViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "FriendsViewController.h"
#import "GroupInstanceViewController.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friends = [Friends sharedInstance];
    self.groups = [Groups sharedInstance];
    [self loadTableWithKey:@"Friends"];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If table is composed of groups, push GroupInstanceView, else do nothing
    if ([self.friendOrGroupSwitch selectedSegmentIndex] == 1) {
        int cellIndex = indexPath.row;
        UIStoryboard *storyBoard = self.storyboard;
        GroupInstanceViewController *groupInstanceViewController = [storyBoard instantiateViewControllerWithIdentifier:@"GroupVC"];
        [groupInstanceViewController loadCurrentGroupWithIndex:cellIndex];
        [self.navigationController pushViewController:groupInstanceViewController animated:YES];
    }
}

- (void)loadTableWithKey:(NSString*)key
{
    if ([key isEqualToString:@"Friends"]) {
        self.tableView.dataSource = self.friends;
    } else if ([key isEqualToString:@"Groups"]) {
        self.tableView.dataSource = self.groups;
    }
    [self.tableView reloadData];
}

- (IBAction)friendOrGroupSwitchWasPressed:(id)sender
{
    if ([self.friendOrGroupSwitch selectedSegmentIndex] == 0) {
        [self loadTableWithKey:@"Friends"];
    } else {
        [self loadTableWithKey:@"Groups"];
    }
}

@end
