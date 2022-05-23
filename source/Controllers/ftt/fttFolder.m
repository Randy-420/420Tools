#include "fttFolder.h"

@implementation fttFolder
- (instancetype)init{
	myIcon = @"ftthead";
	myTitle = @"Flex To Theos Folder Handling";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	self.plistName = @"fttFolder";
	self.chosenIDs = @[@"Dump", @"DumpPath"];
	return [super specifiers];
}

-(void)Save{
	[super Save];
	NSString *path = GetNSString(@"dumpFolder", @"/var/mobile/tweaks/myFlex", @"com.randy420.fttprefs");
	if (![[path substringToIndex:1] isEqualToString:@"/"]){
		NSFileManager *FM = [[NSFileManager alloc] init];
		path = [NSString stringWithFormat:@"/%@", path];

		NSMutableDictionary *preferences;
		if ([FM fileExistsAtPath:@"/var/mobile/Library/Preferences/com.randy420.fttprefs.plist"]) {
			preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.fttprefs.plist"];
		} else {
			preferences = [[NSMutableDictionary alloc] init];
		}
		[preferences setObject:path forKey: @"dumpFolder"];
		[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.fttprefs.plist" atomically:YES];
		[self reloadSpecifiers];
	}
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];

	NSString *key = [specifier propertyForKey:@"key"];

	if([key isEqualToString:@"useDumpFolder"]){
		if(![value boolValue]){
			[self hideMe:@"DumpPath" animate:YES];
		} else {
			[self showMe:@"DumpPath" after:@"Dump" animate:YES];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	if (!GetBool(@"useDumpFolder", YES, @"com.randy420.fttprefs"))
		[self hideMe:@"DumpPath" animate:NO];
}
@end