#include "toolsRootListController.h"
#include "functions/.profile.h"
#include "functions/.zprofile.h"

#include "includes/declarations.h"
#include "includes/loader.h"
#include "includes/popup.h"
#include "includes/delete.h"

	NSFileManager *fileManager;

	foo *Foo;
@implementation rrRootListController

- (NSArray *)specifiers{
	Foo = [[foo alloc] init];
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"rr" target:self];
	}

	return _specifiers;
}

-(void) deleteRussianLanguage{
	loader();

	dlt("/Library/PreferenceBundles/",deleteall);

	dlt("/System/Library/PreferenceBundles/",deleteall);
	popup();
}

-(void)T{
	[Foo bar:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}

-(void)P{
	[Foo bar:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}
@end

@implementation tools420RootListController
tai *toMove;
- (instancetype)init{
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = @"Randy420 Tools";
		self.titleLabel.textColor = [UIColor whiteColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/420head.png"];
		self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
		self.iconView.alpha = 0.0;
		[self.navigationItem.titleView addSubview:self.iconView];

		[NSLayoutConstraint activateConstraints:@[

		[self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
		[self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
	}
	return self;
}

- (NSArray *)specifiers{
	toMove = [[tai alloc] init];
	Foo = [[foo alloc] init];
	fileManager = NSFileManager.defaultManager;
	self.Up2Date = NO;
	self.Tai = [fileManager fileExistsAtPath:@"/usr/bin/tai"];
	self.rr = [fileManager fileExistsAtPath:@"/usr/bin/rr"];
	self.Ftt = [fileManager fileExistsAtPath:@"/usr/bin/ftt"];
	self.Vs = [fileManager fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/VolumeStep13.dylib"];
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];

		NSArray *chosenIDs = @[@"Ftt", @"Vs", @"Tai", @"Installed", @"rr", @"Not", @"emerald", @"support"];
    self.savedSpecifiers = (_savedSpecifiers) ?: [[NSMutableDictionary alloc] init];
		for(PSSpecifier *specifier in _specifiers){
			if([chosenIDs containsObject:[specifier propertyForKey:@"id"]]){
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	tableView.tableHeaderView = self.headerView;
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat offsetY = scrollView.contentOffset.y;

	if (offsetY > 200){
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if ([fileManager fileExistsAtPath:originalPics]) {
		[self hideMe:@"support" animate:NO];
		[self hideMe:@"emerald" animate:NO];
	}
	if (!self.Up2Date){
	self.totalz = 0;
		[self hideMe:@"Vs" animate:NO];
		[self hideMe:@"Tai" animate:NO];
		[self hideMe:@"Ftt" animate:NO];
		[self hideMe:@"rr" animate:NO];
		if ([self Vs]){ 
			self.totalz += 1;
			[self showMe:@"Vs" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Vs" after:@"Not" animate:NO];
		}
		if (self.Tai){
			self.totalz += 1;
			[self showMe:@"Tai" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Tai" after:@"Not" animate:NO];
		}
		if (self.rr){
			[self showMe:@"rr" after:@"Installed" animate:NO];
		}
		if (self.Ftt){
			self.totalz += 1;
			[self showMe:@"Ftt" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Ftt" after:@"Not" animate:NO];
		}
		if (self.totalz == 3){
			[self hideMe:@"Not" animate:NO];
		} else if ((self.totalz == 0) && !self.rr){
			[self hideMe:@"Installed" animate:NO];
		}
		self.Up2Date = YES;
	}
	if (notificationName){
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	if ([fileManager fileExistsAtPath:originalPics]) {
		[self hideMe:@"support" animate:NO];
		[self hideMe:@"emerald" animate:NO];
	}
	if (!self.Up2Date){
		self.totalz = 0;
		[self hideMe:@"Vs" animate:NO];
		[self hideMe:@"Tai" animate:NO];
		[self hideMe:@"Ftt" animate:NO];
		[self hideMe:@"rr" animate:NO];
		if ([self Vs]){ 
			self.totalz += 1;
			[self showMe:@"Vs" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Vs" after:@"Not" animate:NO];
		}
		if (self.Tai){ 
			self.totalz += 1;
			[self showMe:@"Tai" after:@"Installed" animate:NO];
		} else{ 
			[self showMe:@"Tai" after:@"Not" animate:NO];
		}
		if (self.rr){
			[self showMe:@"rr" after:@"Installed" animate:NO];
		}
		if (self.Ftt){
			self.totalz += 1;
			[self showMe:@"Ftt" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Ftt" after:@"Not" animate:NO];
		}
		if (self.totalz == 3){
			[self hideMe:@"Not" animate:NO];
		} else if ((self.totalz == 0) && !self.rr){
			[self hideMe:@"Installed" animate:NO];
		}
		self.Up2Date = YES;
	}
}

- (void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];

	CGFloat height = [UIScreen mainScreen].bounds.size.height;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,width,0.25 * width)];
	self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width,0.25 * width)];
	self.credit = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,height)];
	self.credit.text = @"";
	self.headerImageView.contentMode = UIViewContentModeScaleToFill;
	self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/420head.png"];
	self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.headerView addSubview:self.headerImageView];

	[NSLayoutConstraint activateConstraints:@[
	[self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
	[self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
	[self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
	[self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

	_table.tableHeaderView = self.headerView;
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

-(void)useAlt{
	if ([fileManager fileExistsAtPath:altPics]) {
		runCode = [NSString stringWithFormat:@"mv %@ %@", origPics, originalPics];
		[toMove RunRoot:runCode WaitUntilExit:YES];
		runCode = [NSString stringWithFormat:@"mv %@ %@", altPics, origPics];
		[toMove RunRoot:runCode WaitUntilExit:YES];
		
	} else {
		runCode = [NSString stringWithFormat:@"mv %@ %@", origPics, altPics];
		[toMove RunRoot:runCode WaitUntilExit:YES];
		runCode = [NSString stringWithFormat:@"mv %@ %@", originalPics, origPics];
		[toMove RunRoot:runCode WaitUntilExit:YES];
	}
	runCode = [NSString stringWithFormat:@"killall Preferences"];
	[toMove RunRoot:runCode WaitUntilExit:YES];
}

-(void)pay{
	[Foo bar:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}

-(void)Twitter2{
	[Foo bar:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}

-(void)Twitter3{
	[Foo bar:@"https://mobile.twitter.com/Alicydia" name:@"Twitter"];
}

-(void)emerald{
	[Foo bar:@"https://theemeraldisle.family" name:@"The Emerald Isle"];
}

-(void)canpng{
	[Foo bar:@"https://mobile.twitter.com/cnylmz35" name:@"Twitter"];
}

-(void)spawnfox{
	[Foo bar:@"https://mobile.twitter.com/MYM_SPAWNFOX" name:@"Twitter"];
}

-(void)GitHub{
	[Foo bar:@"https://github.com/Randy-420" name:@"GitHub"];
}

-(void)BigBoss{
	[Foo bar:@"cydia://url/https://cydia.saurik.com/api/share#?source=https://apt.thebigboss.org/repofiles/cydia/" name:@"Cydia"];
}

-(void)AliCydia{
	[Foo bar:@"cydia://url/https://cydia.saurik.com/api/share#?source=http://alicydia.com" name:@"Cydia"];
}

-(void)CM{
	[Foo bar:@"https://twitter.com/crazymind90" name:@"Twitter"];
}

-(void)Cyx0e{
	[Foo bar:@"https://twitter.com/Cyx0e" name:@"Twitter"];
}

-(void)Tele{
	[Foo bar:@"https://t.me/necr0sis" name:@"Telegram"];
}

-(void)Jim{
	[Foo bar:@"https://twitter.com/soulesskeatonc1" name:@"Twitter"];
}

-(void)Polat{
	[Foo bar:@"https://twitter.com/Polatby12" name:@"Twitter"];
}

-(void)adiktator{
	[Foo bar:@"https://twitter.com/vlad" name:@"Twitter"];
}

-(void) showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate{
	if (![self containsSpecifier:self.savedSpecifiers[showMe]]){
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[showMe]] afterSpecifierID:after animated:animate];
	}
}

-(void) hideMe:(NSString *)hideMe animate:(bool)animate{
	if ([self containsSpecifier:self.savedSpecifiers[hideMe]]){
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[hideMe]] animated:animate];
	}
}
@end






@implementation fttMainViewController
- (instancetype)init{
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = @"Flex To Theos";
		self.titleLabel.textColor = [UIColor whiteColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/ftthead.png"];
		self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
		self.iconView.alpha = 0.0;
		[self.navigationItem.titleView addSubview:self.iconView];

		[NSLayoutConstraint activateConstraints:@[

		[self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
		[self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
	}
	return self;
}

- (NSArray *)specifiers{
	Foo = [[foo alloc] init];
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"fttRoot" target:self];
	}
	return _specifiers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	tableView.tableHeaderView = self.headerView;
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat offsetY = scrollView.contentOffset.y;

	if (offsetY > 200){
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];

	if (notificationName){
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
}

- (void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];

	CGFloat height = [UIScreen mainScreen].bounds.size.height;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,width,0.15 * width)];
	self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width,0.15 * width)];
	self.credit = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,height)];
	self.credit.text = @"";
	self.headerImageView.contentMode = UIViewContentModeScaleToFill;
	self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/ftthead.png"];
	self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.headerView addSubview:self.headerImageView];

	[NSLayoutConstraint activateConstraints:@[
	[self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
	[self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
	[self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
	[self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

	_table.tableHeaderView = self.headerView;
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

-(void)pay{
	[Foo bar:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}

-(void)Twitter2{
	[Foo bar:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}
@end

@implementation fttControl

- (NSArray *)specifiers{
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"fttControl" target:self];
	}

	return _specifiers;
}

-(void)Save
{
    [self.view endEditing:YES];
}

@end

@implementation fttMakefile

- (NSArray *)specifiers{
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"fttMakefile" target:self];
	}

	return _specifiers;
}

@end

@implementation taiprRootListController
	tai *TAI;
- (instancetype)init{
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = @"Theos Auto Installer";
		self.titleLabel.textColor = [UIColor whiteColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/taihead.png"];
		self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
		self.iconView.alpha = 0.0;
		[self.navigationItem.titleView addSubview:self.iconView];

		[NSLayoutConstraint activateConstraints:@[

		[self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
		[self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
	}
	return self;
}
-(void) update{
	self.installed = [fileManager fileExistsAtPath:@"/usr/bin/tai"];
	self.dlAll = [preferences[@"sdks-master"] boolValue];
}
- (NSArray *)specifiers{
	Foo = [[foo alloc] init];
	TAI = [[tai alloc] init];
	fileManager = NSFileManager.defaultManager;
	NSArray *chosenIDs = @[@"nineThree", @"tenThree", @"elevenTwo", @"twelveOneTwo", @"twelveFour", @"thirteen", @"thirteenFour", @"thirteenFive", @"fourteen"];
	[TAI loader];
	[self update];
	saveUDIDOnDecline = NO;
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"Tai" target:self];
		self.savedSpecifiers = (_savedSpecifiers) ?: [[NSMutableDictionary alloc] init];
		for(PSSpecifier *specifier in _specifiers){
			if([chosenIDs containsObject:[specifier propertyForKey:@"id"]]){
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	tableView.tableHeaderView = self.headerView;
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat offsetY = scrollView.contentOffset.y;

	if (offsetY > 200){
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier{
	[super setPreferenceValue:value specifier:specifier];
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	[TAI loader];
	[self update];
	NSString *key = [specifier propertyForKey:@"key"];
	if([key isEqualToString:@"sdks-master"]){
		self.dlAll = [value boolValue];
		if(self.dlAll){
			[self hideMe:@"nineThree" animate:YES];
			[self hideMe:@"tenThree" animate:YES];
			[self hideMe:@"elevenTwo" animate:YES];
			[self hideMe:@"twelveOneTwo" animate:YES];
			[self hideMe:@"twelveFour" animate:YES];
			[self hideMe:@"thirteen" animate:YES];
			[self hideMe:@"thirteenFour" animate:YES];
			[self hideMe:@"thirteenFive" animate:YES];
			[self hideMe:@"fourteen" animate:YES];
		} else{
			[self showMe:@"fourteen" after:@"All" animate:YES];
			[self showMe:@"thirteenFive" after:@"All" animate:YES];
			[self showMe:@"thirteenFour" after:@"All" animate:YES];
			[self showMe:@"thirteen" after:@"All" animate:YES];
			[self showMe:@"twelveFour" after:@"All" animate:YES];
			[self showMe:@"twelveOneTwo" after:@"All" animate:YES];
			[self showMe:@"elevenTwo" after:@"All" animate:YES];
			[self showMe:@"tenThree" after:@"All" animate:YES];
			[self showMe:@"nineThree" after:@"All" animate:YES];
		}
	}
	

	if (notificationName){
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	[TAI loader];
//	[self update];
	if(self.dlAll){
		[self hideMe:@"nineThree" animate:YES];
		[self hideMe:@"tenThree" animate:YES];
		[self hideMe:@"elevenTwo" animate:YES];
		[self hideMe:@"twelveOneTwo" animate:YES];
		[self hideMe:@"twelveFour" animate:YES];
		[self hideMe:@"thirteen" animate:YES];
		[self hideMe:@"thirteenFour" animate:YES];
		[self hideMe:@"thirteenFive" animate:YES];
		[self hideMe:@"fourteen" animate:YES];
	}
}

-(void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];

	CGFloat height = [UIScreen mainScreen].bounds.size.height;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,width,0.50 * width)];
	self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width,0.30 * width)];
	self.credit = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,height)];
	self.credit.text = @"";
	self.headerImageView.contentMode = UIViewContentModeScaleToFill;
	self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/taihead.png"];
	self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.headerView addSubview:self.headerImageView];

	[NSLayoutConstraint activateConstraints:@[
	[self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
	[self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
	[self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
	[self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

	_table.tableHeaderView = self.headerView;
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

-(void) sDks{
	[TAI loader];
	[self update];
	if (self.installed) {
		[TAI enhancer];
		[TAI DoWnLoAd];
	}
	[TAI popup];
}

-(void) fullDl{
	[TAI loader];
	[self update];
	if (self.installed) {
		if ([TAI theosInstall]){
			Profile(YES);
			zProfile(YES);
		}
		[TAI enhancer];
		[TAI DoWnLoAd];
	}
	[TAI popup];
}

-(void) updateTheos{
	[TAI loader];
	[self update];
	if (self.installed) {
		[TAI upDateTheos];
	}
	[TAI popup];
}

-(void) T{
	[Foo bar:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}

-(void) T2{
	[Foo bar:@"https://mobile.twitter.com/Alicydia" name:@"Twitter"];
}

-(void) P{
	[Foo bar:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}

-(void) showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate{
	if (![self containsSpecifier:self.savedSpecifiers[showMe]]){
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[showMe]] afterSpecifierID:after animated:animate];
	}
}

-(void) hideMe:(NSString *)hideMe animate:(bool)animate{
	if ([self containsSpecifier:self.savedSpecifiers[hideMe]]){
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[hideMe]] animated:animate];
	}
}
@end

@implementation vspRootListController
- (instancetype)init{
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = @"VolumeStep13/14";
		self.titleLabel.textColor = [UIColor whiteColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/vshead.png"];
		self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
		self.iconView.alpha = 0.0;
		[self.navigationItem.titleView addSubview:self.iconView];

		[NSLayoutConstraint activateConstraints:@[

		[self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
		[self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
		[self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
		[self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
		[self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
	}
	return self;
}

- (NSArray *)specifiers{
	Foo = [[foo alloc] init];
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"vs" target:self];

		NSArray *chosenIDs = @[@"VibeHide", @"vsSeperate", @"VolumeUp", @"VolumeUpDown", @"prefInt", @"VolumeDown", @"prefIntDown"];
    self.savedSpecifiers = (_savedSpecifiers) ?: [[NSMutableDictionary alloc] init];
		for(PSSpecifier *specifier in _specifiers){
			if([chosenIDs containsObject:[specifier propertyForKey:@"id"]]){
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	tableView.tableHeaderView = self.headerView;
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat offsetY = scrollView.contentOffset.y;

	if (offsetY > 200){
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	[super setPreferenceValue:value specifier:specifier];
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];

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
			if([self containsSpecifier:self.savedSpecifiers[@"prefInt"]]){
				[self showMe:@"VolumeUpDown" after:@"vsSeperate" animate:NO];
				[self hideMe:@"VolumeDown" animate:YES];
				[self hideMe:@"VolumeUp" animate:NO];
				[self hideMe:@"prefIntDown" animate:YES];
			}
		} else if([self containsSpecifier:self.savedSpecifiers[@"prefInt"]]){
			self.separate = YES;
			[self showMe:@"vsSeperate" after:@"vsEnable" animate:YES];
			[self showMe:@"VolumeUp" after:@"vsSeperate" animate:NO];
			[self showMe:@"VolumeDown" after:@"prefInt" animate:YES];
			[self showMe:@"prefIntDown" after:@"VolumeDown" animate:YES];
			[self hideMe:@"VolumeUpDown" animate:NO];
		}
	}
	
	if ([key isEqualToString:@"vsVibEnabled"]){
		if (![value boolValue]){
			[self hideMe:@"VibeHide" animate:YES];
		} else{
			[self showMe:@"VibeHide" after:@"Vibration" animate:YES];
		}
	}

	if (notificationName){
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	NSDictionary *preferences = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.volumestepprefs.plist"];
	if (![preferences[@"VSStepEnabled"] boolValue]){
		[self hideMe:@"vsSeperate" animate:YES];
		[self hideMe:@"VolumeUp" animate:YES];
		[self hideMe:@"VolumeUpDown" animate:YES];
		[self hideMe:@"prefInt" animate:YES];
		[self hideMe:@"VolumeDown" animate:YES];
		[self hideMe:@"prefIntDown" animate:YES];
	}

	if(![preferences[@"vsSeperate"] boolValue]){
		self.separate = NO;
		[self hideMe:@"VolumeUp" animate:NO];
		[self hideMe:@"VolumeDown" animate:YES];
		[self hideMe:@"prefIntDown" animate:YES];
	} else{
		self.separate = YES;
		[self hideMe:@"VolumeUpDown" animate:NO];
	}

	if(![preferences[@"vsVibEnabled"] boolValue]){
		[self hideMe:@"VibeHide" animate:YES];
	}
}

- (void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];

	CGFloat height = [UIScreen mainScreen].bounds.size.height;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,width,0.15 * width)];
	self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width,0.15 * width)];
	self.credit = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,height)];
	self.credit.text = @"";
	self.headerImageView.contentMode = UIViewContentModeScaleToFill;
	self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/tools420.bundle/vshead.png"];
	self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.headerView addSubview:self.headerImageView];

	[NSLayoutConstraint activateConstraints:@[
	[self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
	[self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
	[self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
	[self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

	_table.tableHeaderView = self.headerView;
}

-(id) readPreferenceValue:(PSSpecifier *)specifier{
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

-(void) pay{
	[Foo bar:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}

-(void) Twitter2{
	[Foo bar:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}

-(void) showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate{
	if (![self containsSpecifier:self.savedSpecifiers[showMe]]){
		[self insertContiguousSpecifiers:@[self.savedSpecifiers[showMe]] afterSpecifierID:after animated:animate];
	}
}

-(void) hideMe:(NSString *)hideMe animate:(bool)animate{
	if ([self containsSpecifier:self.savedSpecifiers[hideMe]]){
		[self removeContiguousSpecifiers:@[self.savedSpecifiers[hideMe]] animated:animate];
	}
}
@end

@implementation foo
-(void)bar:(NSString *)bar name:(NSString *)name {
	name = [NSString stringWithFormat:@"Do you want to open %@?", name];
	UIAlertController *ask = [UIAlertController alertControllerWithTitle:@"420 Tools"
			 message:name	 preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:bar] options:@{} completionHandler:nil];
	}];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

	[ask addAction:confirmAction];
	[ask addAction:cancelAction];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ask animated:true completion:nil];

}
@end