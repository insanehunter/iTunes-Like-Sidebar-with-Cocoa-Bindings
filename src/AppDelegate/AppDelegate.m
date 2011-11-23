/*
 * (c) iHunter, 2011
 */
#import "MainWindowController.h"
#import "AppDelegate.h"

@implementation AppDelegate
@synthesize mainWindowController;

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
    mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
	[mainWindowController showWindow:self];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}
@end
