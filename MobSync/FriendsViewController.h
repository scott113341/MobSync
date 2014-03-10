//
//  FriendsViewController.h
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friends.h"
#import "Groups.h"

@interface FriendsViewController : UIViewController <UITableViewDelegate>

@property (strong) Friends *friends;
@property (strong) Groups *groups;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak) IBOutlet UISegmentedControl *friendOrGroupSwitch;

- (IBAction)friendOrGroupSwitchWasPressed:(id)sender;
- (void)loadTableWithKey:(NSString*)key;

@end
