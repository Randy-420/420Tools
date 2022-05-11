#include "fttCode.h"
#define PLIST @"com.randy420.fttprefs"
@implementation fttCode
- (instancetype)init{
	myIcon = @"ftthead";
	myTitle = @"Flex To Theos Code Output Handling";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	//self.plistName = @"fttFolder";
	self.chosenIDs = @[@"finishVoid", @"askVoid", @"askVoidEx", @"finishVoidEx", @"unfinishedVoidEx"];

	if (!_specifiers) {
		NSMutableArray *mutableSpecifiers = [NSMutableArray new];
		PSSpecifier *specifier;

		specifier = groupSpec(@"");
		addSpec;

		specifier = groupSpec(@"(void) Return Method Handling");
		addSpec;

		specifier = switchCell(@"Add \"%orig;\" to void methods");
		setKey(@"finishVoid");
		[specifier setProperty:@YES forKey:@"default"];
		[specifier setProperty:PLIST forKey:@"defaults"];
		setId(@"finishVoid");
		addSpec;

		specifier = switchCell(@"Ask on each void return value");
		setKey(@"askVoid");
		[specifier setProperty:@NO forKey:@"default"];
		[specifier setProperty:PLIST forKey:@"defaults"];
		setId(@"askVoid");
		addSpec;

		specifier = groupSpec(@"finish Void Example:");
		setFooter(@"- (void)exampleMethod {\n	%orig;\n}");
		setId(@"finishVoidEx");
		addSpec;

		specifier = groupSpec(@"unfinished Void Example:");
		setFooter(@"- (void)exampleMethod {\n	//%orig;\n}");
		setId(@"unfinishedVoidEx");
		addSpec;

		specifier = groupSpec(@"ask Void Example:");
		setFooter(@"- (void)exampleMethod {\n{\n	//orig;???\n}\nWould you like to add \"%orig\" to this method? y/n:");
		setId(@"askVoidEx");
		addSpec;

		_specifiers = [mutableSpecifiers copy];

		self.savedSpecifiers = [NSMutableDictionary dictionary];

		for(PSSpecifier *specifier in _specifiers){
			if([self.chosenIDs containsObject:[specifier propertyForKey:@"id"]]){
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];

	NSString *key = [specifier propertyForKey:@"key"];

	if([key isEqualToString:@"finishVoid"]){
		if(![value boolValue]){
			[self showMe:@"askVoid" after:@"finishVoid" animate:NO];
			if (GetBool(@"askVoid", NO, PLIST)){
				[self showMe:@"askVoidEx" after:@"askVoid" animate:NO];
			} else {
				[self showMe:@"unfinishedVoidEx" after:@"askVoid" animate:NO];
			}
			[self hideMe:@"finishVoidEx" animate:NO];
		} else {
			[self showMe:@"finishVoidEx" after:@"finishVoid" animate:NO];
			[self hideMe:@"unfinishedVoidEx" animate:NO];
			[self hideMe:@"askVoid" animate:NO];
			[self hideMe:@"askVoidEx" animate:NO];
		}
	}

	if([key isEqualToString:@"askVoid"]){
		if(![value boolValue]){
			[self showMe:@"unfinishedVoidEx" after:@"askVoid" animate:NO];
			[self hideMe:@"finishVoidEx" animate:NO];
			[self hideMe:@"askVoidEx" animate:NO];
		} else {
			[self showMe:@"askVoidEx" after:@"askVoid" animate:NO];
			[self hideMe:@"unfinishedVoidEx" animate:NO];
			[self hideMe:@"finishVoidEx" animate:NO];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	if (!GetBool(@"finishVoid", YES, PLIST)){
		[self hideMe:@"finishVoidEx" animate:NO];
		if (GetBool(@"askVoid", NO, PLIST))
			[self hideMe:@"unfinishedVoidEx" animate:NO];
			else 
				[self hideMe:@"askVoidEx" animate:NO];
	}else{
		[self hideMe:@"unfinishedVoidEx" animate:NO];
		[self hideMe:@"askVoid" animate:NO];
		[self hideMe:@"askVoidEx" animate:NO];
	}
}
@end