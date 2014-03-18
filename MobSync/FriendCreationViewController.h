//
//  FriendCreationViewController.h
//  MobSync
//
//  Created by Medal, Matthew on 3/10/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCreationViewController : UIViewController

@property (weak) IBOutlet UITextField *username;

-(IBAction)addBUttonWasPressed:(id)sender;
- (IBAction)cancelButtonWasPressed:(id)sender;

@end
