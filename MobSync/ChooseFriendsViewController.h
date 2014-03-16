//
//  ChooseFriendsViewController.h
//  MobSync
//
//  Created by Scott Hardy on 3/10/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mob.h"

@interface ChooseFriendsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableView *friendsTableView;

@property (strong) Mob *mob;

@end
