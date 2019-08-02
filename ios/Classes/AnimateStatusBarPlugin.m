#import "AnimateStatusBarPlugin.h"
#import <animate_status_bar/animate_status_bar-Swift.h>

@implementation AnimateStatusBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAnimateStatusBarPlugin registerWithRegistrar:registrar];
}
@end
