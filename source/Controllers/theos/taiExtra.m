#include "taiExtra.h"

@implementation taiExtra
- (instancetype)init{
	myIcon = @"taihead";
	myTitle = @"Theos Auto Installer";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	fm = [[NSFileManager alloc] init];
	self.plistName = @"taiExtra";
	self.chosenIDs = @[@"changeDebFolder", @"debFolder"];
	return [super specifiers];
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier{
	[super setPreferenceValue:value specifier:specifier];

	NSString *key = [specifier propertyForKey:@"key"];

	if([key isEqualToString:@"changeDebFolder"]){
		if([value boolValue]){
			[self showMe:@"debFolder" after:@"changeDebFolder" animate:YES];
		} else {
			[self hideMe:@"debFolder" animate:NO];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	if (!GetBool(@"changeDebFolder", YES, @"com.randy420.tai"))
		[self hideMe:@"debFolder" animate:NO];
}

-(void)Save{
	[super Save];
	if ([fm fileExistsAtPath:GetNSString(@"Location", @"/var/theos", @"com.randy420.tai")])
		[self RunCMD:@"tai -p" WaitUntilExit:NO];
}
@end