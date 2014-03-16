//
//  ChooseFriendsViewController.m
//  MobSync
//
//  Created by Scott Hardy on 3/10/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "ChooseFriendsViewController.h"
#import "Friends.h"

@interface ChooseFriendsViewController ()

@end

@implementation ChooseFriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.friendsTableView.dataSource = [Friends sharedInstance];
    
    NSLog(@"%@", self.mob.usernameArray);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [self.mob.usernameArray removeObjectIdenticalTo:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    }
    else {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [self.mob.usernameArray addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    }
}

@end
