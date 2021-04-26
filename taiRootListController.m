#include "taiRootListController.h"
#include "functions/.profile.h"
#include "functions/.zprofile.h"

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