/*
 * (c) iHunter, 2011
 */
#import "MainWindowController.h"

@interface MainWindowController ()
@property(nonatomic, weak) IBOutlet NSOutlineView *sidebar;
@property(nonatomic, strong) NSArray *sidebarItems;
@end

#pragma mark -
@implementation MainWindowController
@synthesize sidebar, sidebarItems;

- (id) initWithWindow:(NSWindow *)window
{
    if (!(self = [super initWithWindow:window]))
        return nil;
    
    sidebarItems = [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                                @"MAKE BUZZ!", @"title",
                                [NSArray arrayWithObjects:
                                        [NSDictionary dictionaryWithObject:@"Campaign"
                                                                    forKey:@"title"],
                                        [NSDictionary dictionaryWithObject:@"Reaction"
                                                                    forKey:@"title"],
                                        nil], @"children",
                                [NSNumber numberWithBool:YES], @"header",
                                nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                                @"FEED & CARE", @"title",
                                [NSArray arrayWithObjects:
                                        [NSDictionary dictionaryWithObject:@"Audience"
                                                                    forKey:@"title"],
                                        [NSDictionary dictionaryWithObject:@"Expand"
                                                                    forKey:@"title"],
                                        nil], @"children",
                                [NSNumber numberWithBool:YES], @"header",
                                nil],
                        nil];
    return self;
}

- (void) windowDidLoad
{
    NSParameterAssert(sidebar != nil);
    sidebar.floatsGroupRows = NO;
    [sidebar expandItem:nil expandChildren:YES];
}


#pragma mark NSOutlineView delegate methods
- (NSView *) outlineView:(NSOutlineView *)outlineView
                    viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    BOOL isHeader = [[[item representedObject] objectForKey:@"header"] boolValue];
    return [outlineView makeViewWithIdentifier:(isHeader ? @"HeaderCell" : @"DataCell")
                                         owner:self];
}

- (BOOL) outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item
{
    return [[[item representedObject] objectForKey:@"header"] boolValue];
}

- (BOOL) outlineView:(NSOutlineView *)outlineView shouldSelectItem:(id)item
{
    return ![[[item representedObject] objectForKey:@"header"] boolValue];
}
@end
