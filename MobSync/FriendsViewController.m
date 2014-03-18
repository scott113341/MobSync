//
//  FriendsViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "FriendsViewController.h"
#import "GroupInstanceViewController.h"
#import "FriendCreationViewController.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.friends = [Friends sharedInstance];
    self.groups = [Groups sharedInstance];
    
    // remove auto inset of table view cells
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadTableWithKey:@"Friends"];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}


// Table methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If table is composed of groups, push GroupInstanceView, else do nothing
    if ([self.friendOrGroupSwitch selectedSegmentIndex] == 1) {
        int cellIndex = (int)indexPath.row;
        UIStoryboard *storyBoard = self.storyboard;
        GroupInstanceViewController *groupInstanceViewController = [storyBoard instantiateViewControllerWithIdentifier:@"GroupVC"];
        [groupInstanceViewController loadCurrentGroupWithIndex:cellIndex];
        [self.navigationController pushViewController:groupInstanceViewController animated:YES];
    }
}

// End table methods

- (void)loadTableWithKey:(NSString*)key
{
    if ([key isEqualToString:@"Friends"]) {
        self.tableView.dataSource = self.friends;
        self.tableView.allowsSelection = NO;
    } else if ([key isEqualToString:@"Groups"]) {
        self.tableView.dataSource = self.groups;
        self.tableView.allowsSelection = YES;
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

- (IBAction)addButtonWasPressed:(id)sender
{
    UIStoryboard *storyBoard = self.storyboard;
    FriendCreationViewController *friendCreationViewController = [storyBoard instantiateViewControllerWithIdentifier:@"FriendCreationVC"];
    friendCreationViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:friendCreationViewController animated:YES completion:nil];
}

@end
