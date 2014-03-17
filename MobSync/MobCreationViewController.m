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
#import "UserStorage.h"

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
    NSString *usernames = [self.mob.usernameArray componentsJoinedByString:@","];
    
    // get mob data from server
    NSString *uri = @"/mobs.json";
    NSString *body = [NSString stringWithFormat:@"username=%@&usernames=%@&destination=%@", [UserStorage retrieveActiveUser], usernames, self.destination.text];
    NSData *responseData = [MobSyncServer requestURI:uri HTTPMethod:@"POST" HTTPBody:body];
    NSDictionary *response = [MobSyncServer convertDataToJSON:responseData];
    
    if ([response objectForKey:@"id"]) {
        self.mob.name = self.destination.text;
        self.mob.status = 1;
        
        Mobs *mobs = [Mobs sharedInstance];
        [mobs.all addObject:self.mob];
        
        NSLog(@"%@", self.navigationController);
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"An error occurred when creating your mob" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
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
