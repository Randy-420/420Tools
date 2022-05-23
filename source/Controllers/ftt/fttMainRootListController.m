#include "fttMainRootListController.h"

@implementation fttMainViewController
- (instancetype)init{
	myIcon = @"ftthead";
	myTitle = @"Flex To Theos";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	self.plistName = @"fttRoot";
	return [super specifiers];
}

-(void)source{
	[self link:@"https://github.com/Randy-420/ftt" name:@"Github Flex to Theos Source-Code"];
}
@end