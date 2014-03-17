//
//  MobCreationViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/1/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobCreationViewController.h"
#import "MobSyncServer.h"
#import "Mobs.h"

@interface MobCreationViewController ()

@end

@implementation MobCreationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.mob = [[Mob alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // set tableCell detail text fields
    if ([self.mob.usernameArray count] > 0) {
        self.friendCell.detailTextLabel.text = [NSString stringWithFormat:@"%d selected", [self.mob.usernameArray count]];
    } else {
        self.friendCell.detailTextLabel.text = @"";
    }
    if ([self.mob.groupArray count] > 0) {
        self.groupCell.detailTextLabel.text = [NSString stringWithFormat:@"%d selected", [self.mob.groupArray count]];
    } else {
        self.groupCell.detailTextLabel.text = @"";
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self hideKeyboard: nil];
}

-(void)didSelectPickFriends:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    ChooseFriendsViewController *chooseFriendsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ChooseFriendsViewController"];
    
    chooseFriendsViewController.mob = self.mob;
    
    [self.navigationController pushViewController:chooseFriendsViewController animated:YES];
}

// Create mob when user finishes form
-(void)didSelectDone:(id)sender
{
    // get mob data from server
    NSString *uri = @"/mobs.json";
    NSString *body = [NSString stringWithFormat:@"user_id=3&user_idz=3,1,2&destination=%@", self.destination.text];
    [MobSyncServer requestURI:uri HTTPMethod:@"POST" HTTPBody:body];
    
    // create new local mob model
    Mobs *mobs = [Mobs sharedInstance];
    [mobs.all addObject:self.mob];
}

// Delegate method for data passback from Choose[Friends/Group]ViewController
- (void)acceptDataPassback:(NSMutableArray *)usernames
{
    NSLog(@"%@", self.mob.usernameArray);
}

// Keyboard hiding
-(void)hideKeyboard:(id)sender
{
    [self.destination resignFirstResponder];
}

// Table methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = self.storyboard;
    if ([self.tableView cellForRowAtIndexPath:indexPath] == self.friendCell) {
        ChooseFriendsViewController *chooseFriendsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ChooseFriendsViewController"];
        chooseFriendsViewController.mob = self.mob;
        chooseFriendsViewController.delegate = self;
        [self.navigationController pushViewController:chooseFriendsViewController animated:YES];
    } else if ([self.tableView cellForRowAtIndexPath:indexPath] == self.groupCell) {
        ChooseGroupTableViewController *chooseGroupTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"ChooseGroupViewController"];
        chooseGroupTableViewController.mob = self.mob;
        chooseGroupTableViewController.delegate = self;
        [self.navigationController pushViewController:chooseGroupTableViewController animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
