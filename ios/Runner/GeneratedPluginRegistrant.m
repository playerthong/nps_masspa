//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <libphonenumber/LibphonenumberPlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [LibphonenumberPlugin registerWithRegistrar:[registry registrarForPlugin:@"LibphonenumberPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
