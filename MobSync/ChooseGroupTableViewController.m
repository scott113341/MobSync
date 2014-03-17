//
//  ChooseGroupTableViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/17/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "ChooseGroupTableViewController.h"
#import "Groups.h"

@interface ChooseGroupTableViewController ()

@end

@implementation ChooseGroupTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.tableView.dataSource = [Groups sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // if cells were checked previously, recheck them
    NSArray *cells = [self.tableView visibleCells];
    for (UITableViewCell *cell in cells) {
        if ([self.mob.groupArray indexOfObject:cell.textLabel.text] != NSNotFound) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}

- (IBAction)doneButtonWasPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [self.mob.groupArray removeObjectIdenticalTo:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    }
    else {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [self.mob.groupArray addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
