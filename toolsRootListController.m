#include "toolsRootListController.h"
#import <objc/runtime.h>

@implementation tools420RootListController
- (instancetype)init{
	altPics = @"/Library/PreferenceBundles/tools420.bundle/420altIcon.png";
	origPics = @"/Library/PreferenceBundles/tools420.bundle/420icon.png";
	originalPics = @"/Library/PreferenceBundles/tools420.bundle/420origIcon.png";
	myIcon = @"420head";
	myTitle = @"Randy420 Tools";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	NSFileManager *fileManager = NSFileManager.defaultManager;
	self.Up2Date = NO;
	self.Tai = [fileManager fileExistsAtPath:@"/usr/bin/tai"];
	self.rr = [fileManager fileExistsAtPath:@"/usr/bin/rr"];
	self.Ftt = [fileManager fileExistsAtPath:@"/usr/bin/ftt"];
	self.Vs = [fileManager fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/VolumeStep13_14.dylib"];
	self.fixCydia = [fileManager fileExistsAtPath:@"/usr/bin/fixCydia"];

	self.plistName = @"Root";
	self.chosenIDs = @[@"Ftt", @"Vs", @"Tai", @"Installed", @"rr", @"Not", @"emerald", @"support", @"fixCydia"];

	if (!_specifiers) {
		NSMutableArray *mutableSpecifiers = [NSMutableArray new];
		PSSpecifier *specifier;

		specifier = groupSpec(@"");
		addSpec;

		specifier = groupSpec(@"  ✅ Installed:");
		setId(@"Installed");
		addSpec;

		specifier = groupSpec(@"  ❌  Not Installed:");
		setId(@"Not");
		addSpec;

		specifier = linkCell(@"Theos Auto Installer", @"taiprRootListController");
		setId(@"Tai");
		setImg(@"taiicon");
		addSpec;

		specifier = linkCell(@"VolumeStep13/14", @"vspRootListController");
		setId(@"Vs");
		setImg(@"vsicon");
		addSpec;

		specifier = linkCell(@"fixCydia", @"fixCydiaRootListController");
		setId(@"fixCydia");
		setImg(@"cydiaicon");
		addSpec;

		specifier = linkCell(@"Flex to Theos", @"fttMainViewController");
		setId(@"Ftt");
		setImg(@"ftticon");
		addSpec;

		specifier = linkCell(@"Remove Russian Language", @"rrRootListController");
		setId(@"rr");
		setImg(@"rricon");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;

		specifier = buttonCell(@"Use Alternative Icons");
		specifier->action = @selector(useAlt);
		setImg(@"00");
		addSpec;

		specifier = groupSpec(@"  🌎  Contact:");
		addSpec;

		specifier = buttonCell(@"Randy420 (Dev)");
		specifier->action = @selector(Twitter2);
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"Randy420 (Telegram)");
		specifier->action = @selector(Tele);
		setImg(@"teleicon");
		addSpec;

		specifier = buttonCell(@"Cheers a beer 🍺");
		specifier->action = @selector(pay);
		setImg(@"pay");
		addSpec;

		specifier = groupSpec(@"  Support Canadian Business🇨🇦");
		setId(@"support");
		addSpec;

		specifier = buttonCell(@"  🇨🇦  The Emerald Isle  🇨🇦");
		specifier->action = @selector(emerald);
		setImg(@"420icon");
		addSpec;

		specifier = groupSpec(@"Find my tweaks:");
		addSpec;

		specifier = buttonCell(@"BigBoss");
		specifier->action = @selector(BigBoss);
		setImg(@"cydiaicon");
		addSpec;

		specifier = buttonCell(@"Randy420 GitHub");
		specifier->action = @selector(GitHub);
		setImg(@"giticon");
		addSpec;

		specifier = groupSpec(@"  🙏  Special Thanks:");
		addSpec;

		specifier = buttonCell(@"AliCydia");
		specifier->action = @selector(Twitter);
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"CrazyMind");
		specifier->action = @selector(CM);
		setImg(@"t");
		addSpec;

		specifier = groupSpec(@"Translation Credits");
		addSpec;

		specifier = buttonCell(@"Canpng");
		specifier->action = @selector(canpng);
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"Polatby12");
		specifier->action = @selector(Polat);
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"Vlad");
		specifier->action = @selector(adiktator);
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"LailaAzmi");
		specifier->action = @selector(dilfa);
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"SpawnFox");
		specifier->action = @selector(spawnfox);
		setImg(@"t");
		addSpec;

		/*specifier = [PSSpecifier preferenceSpecifierNamed:nil target:nil set:nil get:nil detail:nil cell:PSButtonCell edit:nil];
		specifier.properties[@"cellClass"] = @"HBTwitterCell";
		specifier.properties[@"label"] = @"test";
		specifier.properties[@"user"] = @"rj_skins";
		addSpec;*/
		//specifier = hbTwitterCell(@"test");
		//[specifier setProperty:@"HBTwitterCell" forKey:@"cellClass"];
		//[specifier setProperty:@"rj_skins" forKey:@"user"];
		//[specifier setProperty:@"Randy420" forKey:@"label"];
		//addSpec;

		_specifiers = [mutableSpecifiers copy];


		//specifier->action = @selector(advGen);
		//specifier->cellClass = @selector(HBTwitterCell);//??


		self.savedSpecifiers = [NSMutableDictionary dictionary];
		for(PSSpecifier *specifier in _specifiers){
			if([self.chosenIDs containsObject:[specifier propertyForKey:@"id"]]){
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[super scrollViewDidScroll:scrollView];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier{
	NSFileManager *fileManager = NSFileManager.defaultManager;
	[super setPreferenceValue:value specifier:specifier];
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
		[self hideMe:@"fixCydia" animate:NO];
		if (self.fixCydia){			self.totalz++;
			[self showMe:@"fixCydia" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"fixCydia" after:@"Not" animate:NO];
		}
		if (self.Vs){			self.totalz++;
			[self showMe:@"Vs" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Vs" after:@"Not" animate:NO];
		}
		if (self.Tai){
			self.totalz++;
			[self showMe:@"Tai" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Tai" after:@"Not" animate:NO];
		}
		self.rr ? [self showMe:@"rr" after:@"Installed" animate:NO] :0;
		if (self.Ftt){
			self.totalz++;
			[self showMe:@"Ftt" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Ftt" after:@"Not" animate:NO];
		}
		if (self.totalz == 4){
			[self hideMe:@"Not" animate:NO];
		} else if ((self.totalz == 0) && !self.rr){
			[self hideMe:@"Installed" animate:NO];
		}
		self.Up2Date = YES;
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
		[self hideMe:@"fixCydia" animate: NO];
		if ([self fixCydia]){
			self.totalz++;
			[self showMe:@"fixCydia" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"fixCydia" after:@"Not" animate:NO];
		}
		if ([self Vs]){			self.totalz++;
			[self showMe:@"Vs" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Vs" after:@"Not" animate:NO];
		}
		if (self.Tai){			self.totalz++;
			[self showMe:@"Tai" after:@"Installed" animate:NO];
		} else{			[self showMe:@"Tai" after:@"Not" animate:NO];
		}
		self.rr ? [self showMe:@"rr" after:@"Installed" animate:NO] : 0;
		if (self.Ftt){
			self.totalz++;
			[self showMe:@"Ftt" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Ftt" after:@"Not" animate:NO];
		}
		if (self.totalz == 4){
			[self hideMe:@"Not" animate:NO];
		} else if ((self.totalz == 0) && !self.rr){
			[self hideMe:@"Installed" animate:NO];
		}
		self.Up2Date = YES;
	}
}

- (BOOL)_isRegularWidth {
   return NO;
}

//#if (API_AVAILABLE(ios(11)))
- (UITableViewStyle) tableViewStyle {
	return [super tableViewStyle];//UITableViewStyleInsetGrouped;
}
//#endif

- (void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	return [super readPreferenceValue:specifier];//[self readPrefsValue:specifier path:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]]];
}

-(void)useAlt{
	NSString *runCode;
	NSFileManager *fileManager = NSFileManager.defaultManager;
	if ([fileManager fileExistsAtPath:altPics]) {
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", origPics, originalPics]);
		[self RunCMD:runCode WaitUntilExit:YES];
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", altPics, origPics]);
		[self RunCMD:runCode WaitUntilExit:YES];
	} else {
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", origPics, altPics]);
		[self RunCMD:runCode WaitUntilExit:YES];
		runCode = CC([NSString stringWithFormat:@"mv %@ %@", originalPics, origPics]);
		[self RunCMD:runCode WaitUntilExit:YES];
	}
	runCode = CC([NSString stringWithFormat:@"killall Preferences"]);
	[self RunCMD:runCode WaitUntilExit:YES];
}

-(void)pay{
	[self link:@"https://www.paypal.me/4Randy420" name:@"PayPal"];
}

-(void)Twitter2{
	[self link:@"https://mobile.twitter.com/rj_skins" name:@"Twitter"];
}

-(void)Twitter{
	[self link:@"https://mobile.twitter.com/Alicydia" name:@"Twitter"];
}

-(void)emerald{
	[self link:@"https://theemeraldisle.family" name:@"The Emerald Isle"];
}

-(void)canpng{
	[self link:@"https://mobile.twitter.com/cnylmz35" name:@"Twitter"];
}

-(void)spawnfox{
	[self link:@"https://mobile.twitter.com/MYM_SPAWNFOX" name:@"Twitter"];
}

-(void)GitHub{
	[self link:@"https://github.com/Randy-420" name:@"GitHub"];
}

-(void)BigBoss{
	[self link:@"cydia://url/https://cydia.saurik.com/api/share#?source=https://apt.thebigboss.org/repofiles/cydia/" name:@"Cydia"];
}

-(void)AliCydia{
	[self link:@"cydia://url/https://cydia.saurik.com/api/share#?source=http://alicydia.com" name:@"Cydia"];
}

-(void)CM{
	[self link:@"https://twitter.com/crazymind90" name:@"Twitter"];
}

/*-(void)Cyx0e{
	[self link:@"https://twitter.com/Cyx0e" name:@"Twitter"];
}*/

-(void)Tele{
	[self link:@"tg://t.me/necr0sis" name:@"Telegram"];
}

/*-(void)Jim{
	[self link:@"https://twitter.com/soulesskeatonc1" name:@"Twitter"];
}*/

-(void)Polat{
	[self link:@"https://twitter.com/Polatby12" name:@"Twitter"];
}

-(void)dilfa{
	[self link:@"https://twitter.com/nandhaazmi" name:@"Twitter"];
}

-(void)adiktator{
	[self link:@"https://twitter.com/vlad" name:@"Twitter"];
}
@end