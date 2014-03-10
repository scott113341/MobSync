//
//  MobSyncViewController.h
//  MobSync
//
//  Created by Scott Hardy on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mob.h"
#import "Mobs.h"

@interface MobSyncViewController : UIViewController

@property (weak) IBOutlet UIButton *done;

-(IBAction)didPressDoneButton:(id)sender;

@property (strong) NSDictionary *notificationData;
@property (strong) Mobs *mobs;

@end
