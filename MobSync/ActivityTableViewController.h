//
//  ActivityTableViewController.h
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mobs.h"

@interface ActivityTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *activityTableView;

@property (strong) Mobs *mobs;

@end
