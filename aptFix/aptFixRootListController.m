#include "aptFixRootListController.h"

@implementation aptFixRootListController
-(instancetype)init{
	installed = [[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/aptFix"];
	myIcon = @"aptFix";
	myTitle = @"aptFix";
	self = [super init];
	return self;
}

-(NSArray *)specifiers {
	if (!_specifiers) {
		NSMutableArray *mutableSpecifiers = [NSMutableArray new];
		PSSpecifier *specifier;

		specifier = groupSpec(@"");
		addSpec;
		addSpec;

		specifier = groupSpec(@"  aptFix");
		addSpec;

		specifier = buttonCell(@"aptFix");
		specifier->action = @selector(aptFix);
		setImg(@"cydiaicon");
		setFooter(@"ONLY USE THIS IF YOU'RE HAVING ISSUES WITH CYDIA!");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;

		specifier = groupSpec(@"Power Options");
		addSpec;

		specifier = buttonCell(@"RESPRING");
		specifier->action = @selector(Respring);
		setFooter(@"Restart SpringBoard");
		addSpec;

		specifier = buttonCell(@"LDRESTART");
		specifier->action = @selector(Ldrestart);
		setFooter(@"ldrestart SpringBoard");
		addSpec;

		specifier = buttonCell(@"REBOOT");
		specifier->action = @selector(Reboot);
		setFooter(@"Restart iPhone");
		addSpec;

		specifier = buttonCell(@"SAFEMODE");
		specifier->action = @selector(safeMode);
		setFooter(@"Restart iPhone");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;
		addSpec;

		specifier = buttonCell(@"aptFix Source Code");
		specifier->action = @selector(source);
		setImg(@"giticon");
		addSpec;

		_specifiers = [mutableSpecifiers copy];
	}
	return _specifiers;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[super scrollViewDidScroll:scrollView];
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
}

-(BOOL)_isRegularWidth {
	return NO;
}

-(UITableViewStyle) tableViewStyle {
	return [super tableViewStyle];
}

-(void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	return [super readPreferenceValue:specifier];//[self readPrefsValue:specifier path:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]]];
}

-(void) popUp:(NSString *)popUp{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"aptFix" message: popUp preferredStyle:UIAlertControllerStyleAlert];

			
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		if (installed)
			[self RunCMD:CC(runCode) WaitUntilExit:YES];

		UIAlertController *cleared = [UIAlertController alertControllerWithTitle:@"aptFix" message:@"Errors should be cleared successfully!" preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *clearedAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
			
		}];
		[cleared addAction:clearedAction];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:cleared animated:true completion:nil];
	}];
	[alert addAction:action];

	if (installed){
		action = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		}];
		[alert addAction:action];
	}

	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

-(void)aptFix{
	if (installed) {
		runCode = @"killall Cydia;killall apt apt-get;rm -rf /var/log/apt;mkdir /var/log/apt;rm -f /var/lib/apt/lists/lock;rm -f /var/lib/dpkg/lock-frontend;rm -f /var/cache/apt/archives/lock;rm -f /var/lib/dpkg/lock;dpkg --configureu -a";
		[self popUp:@"Only run if you're unable to fix the errors yourself."];
		return;
	}
	[self popUp:@"Please install \"aptFix\" from BigBoss"];
}

-(void)safeMode{
	if (installed) {
		runCode = @"killall -SEGV SpringBoard";
		[self popUp:@"Are you sure you want to launch into SAFEMODE?"];
	}
	[self popUp:@"Please install \"aptFix\" from BigBoss"];
}

-(void)Reboot{
	if (installed) {
		runCode = @"reboot";
		[self popUp:@"Are you sure you want to REBOOT?"];
	}
	[self popUp:@"Please install \"aptFix\" from BigBoss"];
}

-(void)Ldrestart{
	if (installed) {
		runCode = @"ldrestart";
		[self popUp:@"Are you sure you want to LDRESTART?"];
		}
		[self popUp:@"Please install this deb from BigBoss"];
}

-(void)Respring{
	if (installed) {
		runCode = @"killall backboardd";
		[self popUp:@"Are you sure you want to RESPRING?"];
	}
	[self popUp:@"Please install this deb from BigBoss"];
}

-(void)source{
	[self link:@"https://github.com/Randy-420/aptFix" name:@"Github aptFix Source-Code"];
}
@end