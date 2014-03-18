//
//  ActivityTableViewCell.h
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mob.h"

@interface ActivityTableViewCell : UITableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andMob:(Mob *)mob andHeight:(CGFloat)height;

@property (strong) Mob *mob;
@property (strong) UIView *statusBar;

@end
