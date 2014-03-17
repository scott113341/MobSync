//
//  ChooseGroupTableViewController.h
//  MobSync
//
//  Created by Medal, Matthew on 3/17/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mob.h"

// We implement a protocol to allow MobCreationViewController to be set as delegate of
// this view controller to allow the passing of creation data upwards on the VC stack
@class ChooseGroupTableViewController;
@protocol ChooseGroupViewControllerDelegate <NSObject>
- (void)acceptDataPassback:(NSMutableArray *)usernames;
@end

@interface ChooseGroupTableViewController : UITableViewController

@property (nonatomic, weak) id <ChooseGroupViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *friendsTableView;

- (IBAction)doneButtonWasPressed:(id)sender;

@property (strong) Mob *mob;

@end
