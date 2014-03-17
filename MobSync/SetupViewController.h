//
//  SetupViewController.h
//  MobSync
//
//  Created by Scott Hardy on 3/8/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface SetupViewController : UIViewController

@property (weak) IBOutlet UITextField *nameTextField;

-(IBAction)continueButtonWasPressed:(id)sender;

@property (weak) NSUserDefaults *defaults;

-(BOOL)createUser;
-(void)dismiss;

@end
