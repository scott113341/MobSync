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

@interface MobCreationViewController : UIViewController

@property (weak) IBOutlet UITextField *destination;

-(IBAction)didSelectPickFriends:(id)sender;
-(IBAction)didSelectDone:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

@property (strong) Mob *mob;
@property (strong) NSMutableArray *usernames;

@end
