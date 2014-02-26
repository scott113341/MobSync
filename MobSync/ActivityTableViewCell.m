//
//  ActivityTableViewCell.m
//  MobSync
//
//  Created by Scott Hardy on 2/26/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andMob:(Mob *)mob andHeight:(CGFloat)height
{
    ActivityTableViewCell *cell = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (cell) {
        self.mob = mob;
        
        cell.textLabel.text = mob.name;
        cell.detailTextLabel.text = @"2/26/2014";
        cell.detailTextLabel.textColor = [mob statusColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.indentationWidth, height)];
        self.statusBar.backgroundColor = [mob statusColor];
        [cell.contentView addSubview:self.statusBar];
    }
    
    return cell;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    self.statusBar.backgroundColor = [self.mob statusColor];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    self.statusBar.backgroundColor = [self.mob statusColor];
}

@end
