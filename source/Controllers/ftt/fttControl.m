#include "fttControl.h"

@implementation fttControl
- (instancetype)init{
	myIcon = @"ftthead";
	myTitle = @"Flex To Theos Control File Handling";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	self.plistName = @"fttControl";
	return [super specifiers];
}
@end