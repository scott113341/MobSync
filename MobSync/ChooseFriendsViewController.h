//
//  ChooseFriendsViewController.h
//  MobSync
//
//  Created by Scott Hardy on 3/10/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mob.h"

// We implement a protocol to allow MobCreationViewController to be set as delegate of
// this view controller to allow the passing of creation data upwards on the VC stack
@class ChooseFriendsViewController;
@protocol ChooseFriendsViewControllerDelegate <NSObject>
- (void)acceptDataPassback:(NSMutableArray *)usernames;
@end

@interface ChooseFriendsViewController : UITableViewController

@property (nonatomic, weak) id <ChooseFriendsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *friendsTableView;

- (IBAction)doneButtonWasPressed:(id)sender;

@property (strong) Mob *mob;

@end
