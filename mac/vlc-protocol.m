// https://www.cocoawithlove.com/2010/09/minimalist-cocoa-programming.html
#import <Cocoa/Cocoa.h>

void launchVLC(NSString *url) {
  NSWorkspace *ws = [NSWorkspace sharedWorkspace];
  NSURL *app = [NSURL fileURLWithPath:@"/Applications/VLC.app"];
  NSArray *arguments = [NSArray arrayWithObjects: @"--open", url, nil];
  NSMutableDictionary *config = [[NSMutableDictionary alloc] init];
  [config setObject:arguments forKey:NSWorkspaceLaunchConfigurationArguments];
  [ws launchApplicationAtURL:app options:NSWorkspaceLaunchNewInstance configuration:config error:nil];
}

@interface AppDelegate : NSObject <NSApplicationDelegate>
@end

@implementation AppDelegate

- (void)handleAppleEvent:(NSAppleEventDescriptor *)event withReplyEvent: (NSAppleEventDescriptor *)replyEvent {
  // Get input data
  NSString *input = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
  NSString *url;
  if ([input hasPrefix:@"vlc://"]) {
    url = [input substringFromIndex:6];
  }
  else if ([input hasPrefix:@"vlc:"]) {
    url = [input substringFromIndex:4];
  }
  else {
    // invalid input
    [NSApp terminate:nil];
    return;
  }

  // Only allow urls starting with http:// or https://
  if (![url hasPrefix:@"http://"] && ![url hasPrefix:@"https://"]) {
    // protocol not allowed
    [NSApp terminate:nil];
    return;
  }

  launchVLC(url);

  // Close this program
  [NSApp terminate:nil];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  // If there's a URL in the clipboard then open VLC with that
  // We won't get here if the apple event above runs (it will terminate the app first)
  NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
  NSString* url = [pasteboard stringForType:NSPasteboardTypeString];
  if ([url hasPrefix:@"vlc://"]) {
    url = [url substringFromIndex:6];
  }
  else if ([url hasPrefix:@"vlc:"]) {
    url = [url substringFromIndex:4];
  }
  if ([url hasPrefix:@"http://"] || [url hasPrefix:@"https://"]) {
    // printf("%s\n", [url UTF8String]);
    launchVLC(url);
  }

  // Close this program if it wasn't launched using a link (i.e. launched normally)
  [NSApp terminate:nil];
}

@end

int main() {
  // Make sure the shared application is created
  [NSApplication sharedApplication];

  AppDelegate *appDelegate = [AppDelegate new];
  NSAppleEventManager *sharedAppleEventManager = [NSAppleEventManager new];
  [sharedAppleEventManager setEventHandler:appDelegate
                               andSelector:@selector(handleAppleEvent:withReplyEvent:)
                             forEventClass:kInternetEventClass
                                andEventID:kAEGetURL];

  [NSApp setDelegate:appDelegate];
  [NSApp run];
  return 0;
}
