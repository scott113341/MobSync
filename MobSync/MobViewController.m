//
//  MobViewController.m
//  MobSync
//
//  Created by Medal, Matthew on 3/1/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "MobViewController.h"
#import "MobCreationViewController.h"

@interface MobViewController ()

@end

@implementation MobViewController

UIImageView *buttonRing;

- (IBAction)mobButtonWasPressed:(id)sender
{
    [self performSegueWithIdentifier:@"MobCreationSegue"
                              sender:self];
}

- (void)refreshButtonAnimation
{
    // Clear and restart btn ring animation
    [buttonRing removeFromSuperview];
    buttonRing = nil;
    buttonRing = [[UIImageView alloc] initWithFrame:CGRectMake(67, 186, 184, 184)];
    buttonRing.image = [UIImage imageNamed:@"BtnRing.png"];
    [self.view addSubview:buttonRing];
    [UIView animateWithDuration:1.2
                          delay:0.0
                        options: (UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         buttonRing.alpha = 0.0;
                         buttonRing.transform = CGAffineTransformMakeScale(1.7, 1.7);
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Animation ended.");
                     }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshButtonAnimation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Add observer for when animations need to be restarted
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshButtonAnimation)
                                                 name:@"RelaunchAnimations"
                                               object:nil];
}

@end
