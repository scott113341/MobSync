//
//  MobCreationViewController.h
//  MobSync
//
//  Created by Medal, Matthew on 3/1/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mobs.h"
#import "Mob.h"
#import "ChooseFriendsViewController.h"
#import "ChooseGroupTableViewController.h"

@interface MobCreationViewController : UITableViewController <ChooseFriendsViewControllerDelegate, ChooseGroupViewControllerDelegate>

@property (weak) IBOutlet UITextField *destination;
@property (nonatomic, weak) IBOutlet UITableViewCell *friendCell;
@property (nonatomic, weak) IBOutlet UITableViewCell *groupCell;

- (IBAction)didSelectPickFriends:(id)sender;
- (IBAction)didSelectDone:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@property (strong) Mob *mob;

@end
