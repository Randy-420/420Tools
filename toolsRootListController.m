#include "toolsRootListController.h"

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
	Run = [[cmd alloc] init];
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
		[Run RunCMD:runCode WaitUntilExit:YES];
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", altPics, origPics]);
		[Run RunCMD:runCode WaitUntilExit:YES];
		
	} else {
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", origPics, altPics]);
		[Run RunCMD:runCode WaitUntilExit:YES];
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", originalPics, origPics]);
		[Run RunCMD:runCode WaitUntilExit:YES];
	}
	runCode = CC([NSString stringWithFormat:@"killall Preferences"]);
	[Run RunCMD:runCode WaitUntilExit:YES];
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