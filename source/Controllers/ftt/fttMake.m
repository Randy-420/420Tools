#include "fttMake.h"

@implementation fttMakefile
- (instancetype)init{
	myIcon = @"ftthead";
	myTitle = @"Flex To Theos Makefile Handling";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	self.plistName = @"fttMakefile";
	return [super specifiers];
}
@end