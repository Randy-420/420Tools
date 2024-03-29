#include "vspRootListController.h"

@implementation vspRootListController
- (instancetype)init{
	myIcon = @"vshead";
	myTitle = @"VolumeStep13/14";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	self.plistName = @"vs";
	self.chosenIDs = @[@"VibeHide", @"vsSeperate", @"VolumeUp", @"VolumeUpDown", @"prefInt", @"VolumeDown", @"prefIntDown", @"VibMinMax"];
	return [super specifiers];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
	NSString *key = [specifier propertyForKey:@"key"];
	if ([key isEqualToString:@"VSStepEnabled"]){
		if (![value boolValue]){
			[self hideMe:@"vsSeperate" animate:YES];
			[self hideMe:@"VolumeUp" animate:YES];
			[self hideMe:@"VolumeUpDown" animate:YES];
			[self hideMe:@"prefInt" animate:YES];
			[self hideMe:@"VolumeDown" animate:YES];
			[self hideMe:@"prefIntDown" animate:YES];
		} else{
			[self showMe:@"vsSeperate" after:@"vsEnable" animate:YES];
			[self showMe:@"prefInt" after:@"vsSeperate" animate:YES];

			if (self.separate){
				[self showMe:@"VolumeUp" after:@"vsSeperate" animate:YES];
				[self showMe:@"VolumeDown" after:@"prefInt" animate:YES];
				[self showMe:@"prefIntDown" after:@"VolumeDown" animate:YES];
				[self hideMe:@"VolumeUpDown" animate:YES];
			} else{
				[self showMe:@"VolumeUpDown" after:@"vsSeperate" animate:YES];
				[self hideMe:@"VolumeDown" animate:YES];
				[self hideMe:@"VolumeUp" animate:YES];
				[self hideMe:@"prefIntDown" animate:YES];
			}
		}
	}

	if ([key isEqualToString:@"vsSeperate"]){
		if (![value boolValue]){
			self.separate = NO;
			if ([self containsSpecifier:self.savedSpecifiers[@"prefInt"]]){
				[self showMe:@"VolumeUpDown" after:@"vsSeperate" animate:NO];
				[self hideMe:@"VolumeDown" animate:YES];
				[self hideMe:@"VolumeUp" animate:NO];
				[self hideMe:@"prefIntDown" animate:YES];
			}
		} else if ([self containsSpecifier:self.savedSpecifiers[@"prefInt"]]){
			self.separate = YES;
			[self showMe:@"vsSeperate" after:@"vsEnable" animate:YES];
			[self showMe:@"VolumeUp" after:@"vsSeperate" animate:NO];
			[self showMe:@"VolumeDown" after:@"prefInt" animate:YES];
			[self showMe:@"prefIntDown" after:@"VolumeDown" animate:YES];
			[self hideMe:@"VolumeUpDown" animate:NO];
		}
	}	if ([key isEqualToString:@"vsVibEnabled"]){
		if (![value boolValue]){
			[self hideMe:@"VibMinMax" animate:YES];
			[self hideMe:@"VibeHide" animate:YES];
		} else{
			[self showMe:@"VibMinMax" after:@"Vibration" animate:YES];
			[self showMe:@"VibeHide" after:@"VibMinMax" animate:YES];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	NSString *local = @"com.randy420.volumestepprefs";
	if (!GetBool(@"VSStepEnabled", YES, local)){
		[self hideMe:@"vsSeperate" animate:YES];
		[self hideMe:@"VolumeUp" animate:NO];
		[self hideMe:@"VolumeUpDown" animate:NO];
		[self hideMe:@"prefInt" animate:YES];
		[self hideMe:@"VolumeDown" animate:YES];
		[self hideMe:@"prefIntDown" animate:YES];
	}

	if (!GetBool(@"vsSeperate", NO, local)){
		self.separate = NO;
		[self hideMe:@"VolumeUp" animate:YES];
		[self hideMe:@"VolumeDown" animate:YES];
		[self hideMe:@"prefIntDown" animate:YES];
	} else{
		self.separate = YES;
		[self hideMe:@"VolumeUpDown" animate:YES];
	}

	if (!GetBool(@"vsVibEnabled", NO, local)) {
		[self hideMe:@"VibeHide" animate:YES];
		[self hideMe:@"VibMinMax" animate:YES];
	}
}

-(void)source{
	[self link:@"https://github.com/Randy-420/VolumeStep13" name:@"Github VolumeStep13/14 Source-Code"];
}
@end