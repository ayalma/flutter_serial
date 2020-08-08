#import "FserialPlugin.h"
#if __has_include(<fserial/fserial-Swift.h>)
#import <fserial/fserial-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fserial-Swift.h"
#endif

@implementation FserialPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFserialPlugin registerWithRegistrar:registrar];
}
@end
