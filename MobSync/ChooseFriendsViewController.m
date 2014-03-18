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
    self.navigationItem.hidesBackButton = YES;
    self.friendsTableView.dataSource = [Friends sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // if cells were checked previously, recheck them
    NSArray *cells = [self.tableView visibleCells];
    for (UITableViewCell *cell in cells) {
        NSLog(@"%@", cell.textLabel.text);
        if ([self.mob.usernameArray indexOfObject:cell.textLabel.text] != NSNotFound) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}

- (IBAction)doneButtonWasPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [self.mob.usernameArray removeObjectIdenticalTo:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    }
    else {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [self.mob.usernameArray addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
