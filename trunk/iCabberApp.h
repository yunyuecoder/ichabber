#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>
#import <GraphicsServices/GraphicsServices.h>
#import <IOKit/pwr_mgt/IOPMLib.h>
#import <IOKit/IOMessage.h>

@interface iCabberApp : UIApplication {
    UIWindow *window;
    io_connect_t root_port;
    io_object_t notifier;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
- (void)applicationSuspend:(GSEvent *)event;
- (void)applicationResume:(GSEvent *)event;
- (void)powerMessageReceived:(natural_t)messageType withArgument:(void *) messageArgument;

@end