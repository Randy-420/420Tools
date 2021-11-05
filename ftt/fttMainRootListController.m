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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[super scrollViewDidScroll:scrollView];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
}

- (void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	return [super readPreferenceValue:specifier];//[self readPrefsValue:specifier path:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]]];
}

-(void)source{
	[self link:@"https://github.com/Randy-420/ftt" name:@"Github Flex to Theos Source-Code"];
}
@end