#include "taiDownloads.h"

@implementation taiDownloads
- (instancetype)init{
	myIcon = @"taihead";
	myTitle = @"Theos Auto Installer";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	fm = [[NSFileManager alloc] init];
	self.plistName = @"taiDownloads";
	self.chosenIDs = @[@"all", @"eightFour", @"nineThree", @"ten", @"tenThree", @"eleven", @"elevenOne", @"elevenTwo", @"elevenThree", @"elevenFour", @"twelveOneTwo", @"twelveTwo", @"twelveFour", @"thirteen", @"thirteenTwo", @"thirteenFour", @"thirteenFive", @"fourteen", @"fourteenOne", @"fourteenTwo", @"fourteenThree", @"fourteenFour", @"fourteenFive"];
	return [super specifiers];
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier{
	[super setPreferenceValue:value specifier:specifier];

	NSString *key = [specifier propertyForKey:@"key"];

	if([key isEqualToString:@"sdks-master"]){
		if([value boolValue]){
			[self hideMe:@"eightFour" animate:YES];
			[self hideMe:@"nineThree" animate:YES];
			[self hideMe:@"ten" animate:YES];
			[self hideMe:@"tenThree" animate:YES];
			[self hideMe:@"eleven" animate:YES];
			[self hideMe:@"elevenOne" animate:YES];
			[self hideMe:@"elevenTwo" animate:YES];
			[self hideMe:@"elevenThree" animate:YES];
			[self hideMe:@"elevenFour" animate:YES];
			[self hideMe:@"twelveOneTwo" animate:YES ];
			[self hideMe:@"twelveTwo" animate:YES];
			[self hideMe:@"twelveFour" animate:YES];
			[self hideMe:@"thirteen" animate:YES];
			[self hideMe:@"thirteenTwo" animate:YES];
			[self hideMe:@"thirteenFour" animate:YES];
			[self hideMe:@"thirteenFive" animate:YES];
			[self hideMe:@"fourteen" animate:YES];
			[self hideMe:@"fourteenOne" animate:YES];
			[self hideMe:@"fourteenTwo" animate:YES];
			[self hideMe:@"fourteenThree" animate:YES];
			[self hideMe:@"fourteenFour" animate:YES];
			//[self hideMe:@"fourteenFive" animate:YES];
		} else{
			//[self showMe:@"fourteenFive" after:@"All" animate:YES];
			[self showMe:@"fourteenFour" after:@"All" animate:YES];
			[self showMe:@"fourteenThree" after:@"All" animate:YES];
			[self showMe:@"fourteenTwo" after:@"All" animate:YES];
			[self showMe:@"fourteenOne" after:@"All" animate:YES];
			[self showMe:@"fourteen" after:@"All" animate:YES];
			[self showMe:@"thirteenFive" after:@"All" animate:YES];
			[self showMe:@"thirteenFour" after:@"All" animate:YES];
			[self showMe:@"thirteenTwo" after:@"All" animate:YES];
			[self showMe:@"thirteen" after:@"All" animate:YES];
			[self showMe:@"twelveFour" after:@"All" animate:YES];
			[self showMe:@"twelveTwo" after:@"All" animate:YES];
			[self showMe:@"twelveOneTwo" after:@"All" animate:YES];
			[self showMe:@"elevenFour" after:@"All" animate:YES];
			[self showMe:@"elevenThree" after:@"All" animate:YES];
			[self showMe:@"elevenTwo" after:@"All" animate:YES];
			[self showMe:@"elevenOne" after:@"All" animate:YES];
			[self showMe:@"eleven" after:@"All" animate:YES];
			[self showMe:@"tenThree" after:@"All" animate:YES];
			[self showMe:@"ten" after:@"All" animate:YES];
			[self showMe:@"nineThree" after:@"All" animate:YES];
			[self showMe:@"eightFour" after:@"All" animate:YES];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];

	if(GetBool(@"sdks-master", NO, @"com.randy420.tai")){
		[self hideMe:@"eightFour" animate:YES];
		[self hideMe:@"nineThree" animate:YES];
		[self hideMe:@"ten" animate:YES];
		[self hideMe:@"tenThree" animate:YES];
		[self hideMe:@"eleven" animate:YES];
		[self hideMe:@"elevenOne" animate:YES];
		[self hideMe:@"elevenTwo" animate:YES];
		[self hideMe:@"elevenThree" animate:YES];
		[self hideMe:@"elevenFour" animate:YES];
		[self hideMe:@"twelveOneTwo" animate:YES ];
		[self hideMe:@"twelveTwo" animate:YES];
		[self hideMe:@"twelveFour" animate:YES];
		[self hideMe:@"thirteen" animate:YES];
		[self hideMe:@"thirteenTwo" animate:YES];
		[self hideMe:@"thirteenFour" animate:YES];
		[self hideMe:@"thirteenFive" animate:YES];
		[self hideMe:@"fourteen" animate:YES];
		[self hideMe:@"fourteenOne" animate:YES];
		[self hideMe:@"fourteenTwo" animate:YES];
		[self hideMe:@"fourteenThree" animate:YES];
		[self hideMe:@"fourteenFour" animate:YES];
		//[self hideMe:@"fourteenFive" animate:YES];
	}
}
@end