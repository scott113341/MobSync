//
//  Groups.m
//  MobSync
//
//  Created by Medal, Matthew on 3/9/14.
//  Copyright (c) 2014 PWNZONE. All rights reserved.
//

#import "Groups.h"
#import "Group.h"
#import "UserStorage.h"

@implementation Groups

// Designated init
- (id)initFromStorage
{
    //return [UserStorage retrieveGroups];
    if (self = [super init]) {
        self.groups = [NSMutableArray array];
        NSArray *onebro = [NSArray arrayWithObjects:@"bananapants92", nil];
        NSArray *bros = [NSArray arrayWithObjects:@"JeremyJJ", @"WahooNews", nil];
        NSArray *morebros = [NSArray arrayWithObjects:@"LeoplurodonX", @"Scottymac", @"snoopdog", nil];
        [self.groups addObject:[[Group alloc] initWithName:@"Neighbor" AndMembersList:onebro]];
        [self.groups addObject:[[Group alloc] initWithName:@"Good Friends" AndMembersList:bros]];
        [self.groups addObject:[[Group alloc] initWithName:@"Roommates" AndMembersList:morebros]];
    }
    return self;
}

- (Group*)groupAtIndex:(int)index
{
    return [self.groups objectAtIndex:index];
}

- (void)addGroup:(Group *)group
{
    [self.groups addObject:group];
    [UserStorage commitGroups:self];
}

- (int)count
{
    return [self.groups count];
}

// UITableViewDataSource protocol methods
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.groups count];
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
    Group *request = [self.groups objectAtIndex:[indexPath row]];
    
    newCell.textLabel.text = request.name;
    // 
    if (request.membersList.count > 2) {
        newCell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@, and others...", request.membersList[0], request.membersList[1]];
    } else if (request.membersList.count == 2) {
        newCell.detailTextLabel.text = [NSString stringWithFormat:@"%@ and %@", request.membersList[0], request.membersList[1]];
    } else {
        newCell.detailTextLabel.text = [NSString stringWithFormat:@"%@", request.membersList[0]];
    }
    
    return newCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.groups removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationTop];
    // remove from user storage
}
// End table view protocol methods

+ (id)sharedInstance
{
    static Groups *sharedGroupList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGroupList = [[self alloc] initFromStorage];
    });
    return sharedGroupList;
}

@end
