//
//  Friends.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Friends.h"

@implementation Friends

// Designated init
- (id)initFromStorage
{
    //return [UserStorage retrieveGroups];
    if (self = [super init]) {
        self.friends = [NSMutableArray array];
        
        [self.friends addObject:[[Friend alloc] initWithUsername:@"the_badger" AndName:@"John Leshwitz"]];
        [self.friends addObject:[[Friend alloc] initWithUsername:@"BobTheSlayer" AndName:@"Scott Hardy"]];
    }
    return self;
}

- (void)addFriend:(Friend*)friend
{
    [self.friends addObject:friend];
}

- (Friend*)friendAtIndex:(int)index
{
    return [self.friends objectAtIndex:index];
}

/* UITableViewDataSource methods */
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.friends count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"defaultCell";
    UITableViewCell *newCell;
    
    newCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (! newCell)
    {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                         reuseIdentifier:cellID];
    }
    Friend *request = [self.friends objectAtIndex:[indexPath row]];
    
    newCell.textLabel.text = request.username;
    newCell.detailTextLabel.text = request.name;
    
    return newCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.friends removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationTop];
    // remove from user storage
}
// end table view protocol methods

+ (id)sharedInstance
{
    static Friends *sharedFriendsList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFriendsList = [[self alloc] initFromStorage];
    });
    return sharedFriendsList;
}

@end
