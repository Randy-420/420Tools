#include "aptFixRootListController.h"

@implementation aptFixRootListController
-(instancetype)init{
	if (!self)
		self = [super init];

	installed = [[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/aptFix"];
	myIcon = @"aptFix";
	myTitle = @"aptFix";
	self.BundlePath=@"/Library/PreferenceBundles/tools420.bundle";

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
		setFooter(@"Reboot iPhone");
		addSpec;

		specifier = buttonCell(@"SAFEMODE");
		specifier->action = @selector(safeMode);
		setFooter(@"Put iPhone into SafeMode");
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

/*-(BOOL)_isRegularWidth {
	return NO;
}

-(UITableViewStyle) tableViewStyle {
	return [super tableViewStyle];
}*/

-(void) popUp:(NSString *)popUp{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"aptFix" message: popUp preferredStyle:UIAlertControllerStyleAlert];

			__block NSString *value;
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"RUN" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		if (installed)
			value = [self RunCMDWithLog:runCode];

		UIAlertController *cleared = [UIAlertController alertControllerWithTitle:@"aptFix" message:value preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *clearedAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
			
		}];
		[cleared addAction:clearedAction];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:cleared animated:true completion:nil];
	}];
	[alert addAction:action];

	if (installed){
		action = [UIAlertAction actionWithTitle:@"EXIT" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		}];
		[alert addAction:action];
	}

	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

-(void)aptFix{
	if (installed) {
		runCode = @"aptFix";
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