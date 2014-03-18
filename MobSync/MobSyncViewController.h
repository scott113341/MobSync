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

@property (weak) IBOutlet UILabel *destination;
@property (weak) IBOutlet UILabel *people;

-(IBAction)joinButtonWasPressed:(id)sender;
-(IBAction)declineButtonWasPressed:(id)sender;

@property (strong) Mob *mob;
@property (strong) Mobs *mobs;

@end
