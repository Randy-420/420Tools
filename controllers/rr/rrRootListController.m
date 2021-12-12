#include "rrRootListController.h"

@implementation rrRootListController

- (instancetype)init {
	myTitle = @"Remove Russian Language";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	self.plistName = @"rr";
	self.chosenIDs = @[@"first", @"load", @"button"];
	return [super specifiers];
}

-(void)deleteRussianLanguage{
	[self hideMe:@"button" animate:NO];
	[self showMe:@"load" after:@"first" animate:NO];
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"[Remove Russian Language]\n[by: Randy420]" message:@"This will delete all Russian language packs from your tweaks.\n\nAre you sure you want to continue?" preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
		NSString *rrmsg = [self RunCMD:CC(@"rr -~") WaitUntilExit:YES];
		rrmsg = [NSString stringWithFormat:@"%@\n\n***SETTINGS WILL NOW EXIT FOR CHANGES TO TAKE AFFECT***", rrmsg];
		UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"[Remove Russian Language]\n[by: Randy420]" message:rrmsg preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action1){
		[self RunCMD:CC(@"killall Preferences") WaitUntilExit:YES];
	}];
	[alert1 addAction:action1];

		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert1 animated:true completion:nil];
	}];
	[alert addAction:action];

		UIAlertAction *No = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction *No){
				[self hideMe:@"load" animate:NO];
				[self showMe:@"button" after:@"first" animate:NO];
		}];
		[alert addAction:No];
	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[super scrollViewDidScroll:scrollView];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
	[self hideMe:@"load" animate:NO];
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	[self hideMe:@"load" animate:NO];
}

- (void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];
}

-(id) readPreferenceValue:(PSSpecifier *)specifier{
	return [super readPreferenceValue:specifier];//[self readPrefsValue:specifier path:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]]];
}

-(void)source{
	[self link:@"https://github.com/Randy-420/rr" name:@"Github Remove Russian Language Source-Code"];
}
@end