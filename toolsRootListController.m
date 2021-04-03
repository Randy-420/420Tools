#include "toolsRootListController.h"
#include "functions/.profile.h"
#include "functions/.zprofile.h"

static BOOL GetBool(NSString *pkey, BOOL defaultValue, NSString *plst) {
NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [[Dict objectForKey:pkey] boolValue] : defaultValue;
}

static id CC(NSString *CMD) {
	return [NSString stringWithFormat:@"echo \"%@\" | gap",CMD];
}

@implementation rrRootListController
- (NSArray *)specifiers{
	popUp = [[PoP alloc] init];
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"rr" target:self];
	}
	return _specifiers;
}

-(void)loader{
	self.rrfailure = NO;

	self.deleted = 0;
	self.total = 0;

	successfulDelete = @"[Successfully Deleted]\n";
	failedDelete = @"[Failed To Delete]\n";
}

-(void)popup{
	NSString *Title = @"";
	NSString *rrmsg = @"";
	NSString *myProgName = @"[Remove Russian Language\nby: Randy420]\n\n";
	if (self.deleted + self.total == 0){
		Title = [NSString stringWithFormat:@"%@\n[No Russian Packs Installed]\n", myProgName];
	}else{
		Title = [NSString stringWithFormat:@"%@\n%d/%d Language Packs Deleted\n", myProgName, self.deleted, self.total];
		if (self.deleted >= 1){
			rrmsg = [NSString stringWithFormat:@"%@%@\n", rrmsg, successfulDelete];
		}
		if (self.rrfailure){
			rrmsg = [NSString stringWithFormat:@"%@%@\n", rrmsg, failedDelete];
		}
	}
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:Title message: rrmsg preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
	}];
	[alert addAction:action];
	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

-(void)Dlt:(NSString *)Dlt deleteall:(bool)deleteall{
	const char *dir = [Dlt UTF8String];
	NSFileManager *fileManager = NSFileManager.defaultManager;
	tai *CM = [[tai alloc] init];
	struct dirent* de;

	DIR* dr = opendir(dir);
	if (!(dr == NULL)) {

		while ((de = readdir(dr)) != NULL) {
			NSString *Dir = [NSString stringWithUTF8String:dir];
			NSString *path = [NSString stringWithFormat:@"%@%s/ru.lproj", Dir, de->d_name];
			if ([fileManager fileExistsAtPath:path]) {
				self.total+=1;
				if (deleteall) {
					[CM RunCMD:[NSString stringWithFormat:@"rm -rf %@", CC(path)] WaitUntilExit:YES];
				}
				if (![fileManager fileExistsAtPath:path]) {
					self.deleted += 1;
					successfulDelete = [NSString stringWithFormat:@"%s%s/ru.lproj\n", [successfulDelete UTF8String], de->d_name];
				}else{
					failedDelete = [NSString stringWithFormat:@"%s%s/ru.lproj\n", [failedDelete UTF8String], de->d_name];
					self.rrfailure = YES;
				}
			}
		}
		closedir(dr);
	}
}

-(void)deleteRussianLanguage{
	[self loader];
	[self Dlt:@"/Library/PreferenceBundles/" deleteall:YES];
	[self Dlt:@"/System/Library/PreferenceBundles/" deleteall:YES];
	[self popup];
}
@end

@implementation tools420RootListController
- (instancetype)init{
	altPics = @"/Library/PreferenceBundles/tools420.bundle/420altIcon.png";
	origPics = @"/Library/PreferenceBundles/tools420.bundle/420icon.png";
	originalPics = @"/Library/PreferenceBundles/tools420.bundle/420origIcon.png";
	myIcon = @"420head";
	myTitle = @"Randy420 Tools";
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = myTitle;
		self.titleLabel.textColor = [UIColor greenColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
	popUp = [[PoP alloc] init];
	NSFileManager *fileManager = NSFileManager.defaultManager;
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

	if (offsetY > 1){
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 1 - offsetY);
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	NSFileManager *fileManager = NSFileManager.defaultManager;
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
	NSFileManager *fileManager = NSFileManager.defaultManager;
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
	self.headerImageView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
	NSString *runCode;
	NSFileManager *fileManager = NSFileManager.defaultManager;
	if ([fileManager fileExistsAtPath:altPics]) {
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", origPics, originalPics]);
		[toMove RunCMD:runCode WaitUntilExit:YES];
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", altPics, origPics]);
		[toMove RunCMD:runCode WaitUntilExit:YES];
		
	} else {
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", origPics, altPics]);
		[toMove RunCMD:runCode WaitUntilExit:YES];
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", originalPics, origPics]);
		[toMove RunCMD:runCode WaitUntilExit:YES];
	}
	runCode = CC([NSString stringWithFormat:@"killall Preferences"]);
	[toMove RunCMD:runCode WaitUntilExit:YES];
}

-(void)pay{
	[popUp link:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}

-(void)Twitter2{
	[popUp link:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}

-(void)Twitter3{
	[popUp link:@"https://mobile.twitter.com/Alicydia" name:@"Twitter"];
}

-(void)emerald{
	[popUp link:@"https://theemeraldisle.family" name:@"The Emerald Isle"];
}

-(void)canpng{
	[popUp link:@"https://mobile.twitter.com/cnylmz35" name:@"Twitter"];
}

-(void)spawnfox{
	[popUp link:@"https://mobile.twitter.com/MYM_SPAWNFOX" name:@"Twitter"];
}

-(void)GitHub{
	[popUp link:@"https://github.com/Randy-420" name:@"GitHub"];
}

-(void)BigBoss{
	[popUp link:@"cydia://url/https://cydia.saurik.com/api/share#?source=https://apt.thebigboss.org/repofiles/cydia/" name:@"Cydia"];
}

-(void)AliCydia{
	[popUp link:@"cydia://url/https://cydia.saurik.com/api/share#?source=http://alicydia.com" name:@"Cydia"];
}

-(void)CM{
	[popUp link:@"https://twitter.com/crazymind90" name:@"Twitter"];
}

-(void)Cyx0e{
	[popUp link:@"https://twitter.com/Cyx0e" name:@"Twitter"];
}

-(void)Tele{
	[popUp link:@"https://t.me/necr0sis" name:@"Telegram"];
}

-(void)Jim{
	[popUp link:@"https://twitter.com/soulesskeatonc1" name:@"Twitter"];
}

-(void)Polat{
	[popUp link:@"https://twitter.com/Polatby12" name:@"Twitter"];
}

-(void)adiktator{
	[popUp link:@"https://twitter.com/vlad" name:@"Twitter"];
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
	myIcon = @"ftthead";
	myTitle = @"Flex To Theos";
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = myTitle;
		self.titleLabel.textColor = [UIColor greenColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
	popUp = [[PoP alloc] init];
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

	if (offsetY > 1){
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 1 - offsetY);
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
	self.headerImageView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
- (instancetype)init{
	myIcon = @"taihead";
	myTitle = @"Theos Auto Installer";
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = myTitle;
		self.titleLabel.textColor = [UIColor greenColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
	NSFileManager *fileManager = NSFileManager.defaultManager;
	self.installed = [fileManager fileExistsAtPath:@"/usr/bin/tai"];
	self.dlAll = GetBool(@"sdks-master", NO, @"com.randy420.tai");
}
- (NSArray *)specifiers{
	popUp = [[PoP alloc] init];
	TAI = [[tai alloc] init];
	NSArray *chosenIDs = @[@"nineThree", @"tenThree", @"elevenTwo", @"twelveOneTwo", @"twelveFour", @"thirteen", @"thirteenFour", @"thirteenFive", @"fourteen"];
	[TAI loader];
	[self update];
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

	if (offsetY > 1){
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 1 - offsetY);
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
	self.headerImageView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
	myIcon = @"vshead";
	myTitle = @"VolumeStep13/14";
	self = [super init];
	if (self){
		AppearanceSettings *appearanceSettings = [[AppearanceSettings alloc] init];

		self.hb_appearanceSettings = appearanceSettings;
		self.navigationItem.titleView = [UIView new];
		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.titleLabel.text = myTitle;
		self.titleLabel.textColor = [UIColor greenColor];
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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
	popUp = [[PoP alloc] init];
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

	if (offsetY > 1){
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
		}];
	} else{
		[UIView animateWithDuration:0.7 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
		}];
	}

	if (offsetY > 0) offsetY = 0;
	self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 1 - offsetY);
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
	}	if ([key isEqualToString:@"vsVibEnabled"]){
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
	NSString *local = @"com.randy420.volumestepprefs";
	if (!GetBool(@"VSStepEnabled", YES, local)){
		[self hideMe:@"vsSeperate" animate:YES];
		[self hideMe:@"VolumeUp" animate:YES];
		[self hideMe:@"VolumeUpDown" animate:YES];
		[self hideMe:@"prefInt" animate:YES];
		[self hideMe:@"VolumeDown" animate:YES];
		[self hideMe:@"prefIntDown" animate:YES];
	}

	if(!GetBool(@"vsSeperate", NO, local)){
		self.separate = NO;
		[self hideMe:@"VolumeUp" animate:NO];
		[self hideMe:@"VolumeDown" animate:YES];
		[self hideMe:@"prefIntDown" animate:YES];
	} else{
		self.separate = YES;
		[self hideMe:@"VolumeUpDown" animate:NO];
	}

	if(!GetBool(@"vsVibEnabled", NO, local)){
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
	self.headerImageView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
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

@implementation PoP
-(void)link:(NSString *)link name:(NSString *)name {
	name = [NSString stringWithFormat:@"Do you want to open %@?", name];
	UIAlertController *ask = [UIAlertController alertControllerWithTitle:@"420 Tools"
	 message:name	 preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:link] options:@{} completionHandler:nil];
	}];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

	[ask addAction:confirmAction];
	[ask addAction:cancelAction];
	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ask animated:true completion:nil];
}
@end