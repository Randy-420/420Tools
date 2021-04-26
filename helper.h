#include <Preferences/PSListController.h>
#include <Preferences/PSSpecifier.h>
#include <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#include "functions/420.h"

@interface PSListController (iOS12Plus)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
@end

@interface AppearanceSettings : HBAppearanceSettings
@end