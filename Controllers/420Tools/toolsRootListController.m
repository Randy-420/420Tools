#include "toolsRootListController.h"

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
	self.aptFix = [fileManager fileExistsAtPath:@"/usr/bin/aptFix"];

	self.plistName = @"Root";
	self.chosenIDs = @[@"Ftt", @"Vs", @"Tai", @"Installed", @"rr", @"Not", @"emerald", @"support", @"aptFix", @"Contact", @"myTwitter", @"myTelegram", @"Donate", @"cdn", @"Emerald", @"find", @"myRepo", @"BigBoss", @"myGit", @"special", @"ali", @"CM", @"translate", @"polatby", @"vlad", @"dilfa", @"spawnFox", @"canpng", @"saeed", @"igerman"];

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

		specifier = linkCell(@"aptFix", @"aptFixRootListController");
		setId(@"aptFix");
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

		specifier = groupSpec(@"");
		addSpec;

		if (GetBool(@"contactsOpen", NO, @"com.randy420.420tools")){
			specifier = buttonCell(@"▼   Contact:");
		} else {
			specifier = buttonCell(@"►   Contact:");//C͜͡o͜͡n͜͡t͜͡a͜͡c͜͡t͜͡
		}
		specifier->action = @selector(Contact);
		/*setKey(@"alignment");
		setAlign(@"1");*/
		setId(@"Contact");
		addSpec;

		specifier = buttonCell(@"Randy420 (Twitter)");
		specifier->action = @selector(Twitter2);
		setId(@"myTwitter");
		setImg(@"t");
		addSpec;

		specifier = buttonCell(@"Randy420 (Telegram)");
		specifier->action = @selector(Tele);
		setImg(@"teleicon");
		setId(@"myTelegram");
		addSpec;

		specifier = buttonCell(@"Cheers a beer 🍺");
		specifier->action = @selector(pay);
		setImg(@"pay");
		setId(@"Donate");
		addSpec;

		specifier = groupSpec(@"");
		setId(@"support");
		addSpec;

		if (GetBool(@"cdnOpen", NO, @"com.randy420.420tools")){
			specifier = buttonCell(@"▼   Support Canadian Business:");//S͜͡u͜͡p͜͡p͜͡o͜͡r͜͡t͜͡ C͜͡a͜͡n͜͡a͜͡d͜͡i͜͡a͜͡n͜͡ B͜͡u͜͡s͜͡i͜͡n͜͡e͜͡s͜͡s͜͡:
		} else {
			specifier = buttonCell(@"►   Support Canadian Business:");
		}
		specifier->action = @selector(Cdn);
		setId(@"cdn");
		addSpec;

		specifier = buttonCell(@"  🇨🇦  The Emerald Isle  🇨🇦");
		specifier->action = @selector(emerald);
		setId(@"Emerald");
		setImg(@"420icon");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;

		if (GetBool(@"findMyOpen", NO, @"com.randy420.420tools")){
			specifier = buttonCell(@"▼   Find My Tweaks:");//F͜͡i͜͡n͜͡d͜͡ M͜͡y͜͡ T͜͡w͜͡e͜͡a͜͡k͜͡s͜͡:
		} else {
			specifier = buttonCell(@"►   Find My Tweaks:");
		}
		specifier->action = @selector(find);
		setId(@"find");
		addSpec;

		specifier = buttonCell(@"Randy420's Repo");
		specifier->action = @selector(repo);
		setImg(@"cydiaicon");
		setId(@"myRepo");
		addSpec;

		specifier = buttonCell(@"BigBoss");
		specifier->action = @selector(BigBoss);
		setImg(@"cydiaicon");
		setId(@"BigBoss");
		addSpec;

		specifier = buttonCell(@"Randy420 GitHub");
		specifier->action = @selector(GitHub);
		setImg(@"giticon");
		setId(@"myGit");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;

		if (GetBool(@"specialOpen", NO, @"com.randy420.420tools")){
			specifier = buttonCell(@"▼   Special Thanks:");//S͜͡p͜͡e͜͡c͜͡i͜͡a͜͡l͜͡ T͜͡h͜͡a͜͡n͜͡k͜͡s͜͡:
		} else {
			specifier = buttonCell(@"►   Special Thanks:");
		}
		specifier->action = @selector(special);
		setId(@"special");
		addSpec;

		specifier = buttonCell(@"AliCydia");
		specifier->action = @selector(Twitter);
		setImg(@"t");
		setId(@"ali");
		addSpec;

		specifier = buttonCell(@"CrazyMind");
		specifier->action = @selector(CM);
		setImg(@"t");
		setId(@"CM");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;

		if (GetBool(@"translateOpen", NO, @"com.randy420.420tools")){
			specifier = buttonCell(@"▼  Translate Credits:");
		} else {
			specifier = buttonCell(@"►  Translate Credits:");
		}
		specifier->action = @selector(translate);
		setId(@"translate");
		addSpec;

		specifier = buttonCell(@"Canpng");
		specifier->action = @selector(canpng);
		setImg(@"t");
		setId(@"canpng");
		addSpec;

		specifier = buttonCell(@"@Saeed97271 - Arabic");
		specifier->action = @selector(saeed);
		setImg(@"t");
		setId(@"saeed");
		addSpec;

		specifier = buttonCell(@"@iGerman00 - Russian");
		specifier->action = @selector(igerman);
		setImg(@"t");
		setId(@"igerman");
		addSpec;

		specifier = buttonCell(@"Polatby12");
		specifier->action = @selector(Polat);
		setImg(@"t");
		setId(@"polatby");
		addSpec;

		specifier = buttonCell(@"Vlad");
		specifier->action = @selector(adiktator);
		setImg(@"t");
		setId(@"vlad");
		addSpec;

		specifier = buttonCell(@"LailaAzmi");
		specifier->action = @selector(dilfa);
		setImg(@"t");
		setId(@"dilfa");
		addSpec;

		specifier = buttonCell(@"SpawnFox");
		specifier->action = @selector(spawnfox);
		setImg(@"t");
		setId(@"spawnFox");
		addSpec;

		specifier = groupSpec(@"");
		addSpec;
		addSpec;

		specifier = buttonCell(@"420Tools Source Code");
		specifier->action = @selector(source);
		setImg(@"giticon");
		addSpec;

		_specifiers = [mutableSpecifiers copy];

		self.savedSpecifiers = [NSMutableDictionary dictionary];
		for(PSSpecifier *specifier in _specifiers){
			if([self.chosenIDs containsObject:[specifier propertyForKey:@"id"]]){
				[self.savedSpecifiers setObject:specifier forKey:[specifier propertyForKey:@"id"]];
			}
		}
	}
	return _specifiers;
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
		[self hideMe:@"aptFix" animate:NO];

		if (self.Vs){
			self.totalz++;
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

		if (self.aptFix){
			self.totalz++;
			[self showMe:@"aptFix" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"aptFix" after:@"Not" animate:NO];
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

	if (!GetBool(@"contactsOpen", NO, @"com.randy420.420tools")){
		[self hideMe:@"myTwitter" animate:NO];
		[self hideMe:@"myTelegram" animate:NO];
		[self hideMe:@"Donate" animate:NO];
	}

	if (!GetBool(@"cdnOpen", NO, @"com.randy420.420tools")){
		[self hideMe:@"Emerald" animate:NO];
	}

	if (!GetBool(@"findMyOpen", NO, @"com.randy420.420tools")){
		[self hideMe:@"myRepo" animate:NO];
		[self hideMe:@"myGit" animate:NO];
		[self hideMe:@"BigBoss" animate:NO];
	}

	if (!GetBool(@"specialOpen", NO, @"com.randy420.420tools")){
		[self hideMe:@"ali" animate:NO];
		[self hideMe:@"CM" animate:NO];
	}

	if (!GetBool(@"translateOpen", NO, @"com.randy420.420tools")){
		[self hideMe:@"spawnFox" animate:NO];
		[self hideMe:@"dilfa" animate:NO];
		[self hideMe:@"vlad" animate:NO];
		[self hideMe:@"saeed" animate:NO];
		[self hideMe:@"igerman" animate:NO];
		[self hideMe:@"polatby" animate:NO];
		[self hideMe:@"canpng" animate:NO];
	}

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
		[self hideMe:@"aptFix" animate: NO];

		if ([self Vs]){
			self.totalz++;
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
		self.rr ? [self showMe:@"rr" after:@"Installed" animate:NO] : 0;
		if (self.Ftt){
			self.totalz++;
			[self showMe:@"Ftt" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"Ftt" after:@"Not" animate:NO];
		}
		if ([self aptFix]){
			self.totalz++;
			[self showMe:@"aptFix" after:@"Installed" animate:NO];
		} else{
			[self showMe:@"aptFix" after:@"Not" animate:NO];
		}

		if (self.totalz == 4){
			[self hideMe:@"Not" animate:NO];
		} else if ((self.totalz == 0) && !self.rr){
			[self hideMe:@"Installed" animate:NO];
		}
		self.Up2Date = YES;
	}
}

/*- (BOOL)_isRegularWidth {
	return NO;
}*/

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

-(void)saeed{
	[self link:@"https://mobile.twitter.com/saeed97271" name:@"Twitter"];
}

-(void)GitHub{
	[self link:@"https://github.com/Randy-420" name:@"GitHub"];
}

-(void)BigBoss{
	[self link:@"cydia://url/https://cydia.saurik.com/api/share#?source=https://apt.thebigboss.org/repofiles/cydia/" name:@"Cydia"];
}

-(void)repo{
	[self link:@"cydia://url/https://cydia.saurik.com/api/share#?source=https://Randy-420.github.io" name:@"Cydia"];
}

-(void)CM{
	[self link:@"https://twitter.com/crazymind90" name:@"Twitter"];
}

-(void)igerman{
	[self link:@"https://twitter.com/iGerman00" name:@"Twitter"];
}

-(void)Tele{
	[self link:@"tg://t.me/necr0sis" name:@"Telegram"];
}

-(void)Polat{
	[self link:@"https://twitter.com/Polatby12" name:@"Twitter"];
}

-(void)dilfa{
	[self link:@"https://twitter.com/nandhaazmi" name:@"Twitter"];
}

-(void)adiktator{
	[self link:@"https://twitter.com/vlad" name:@"Twitter"];
}

-(void)source{
	[self link:@"https://github.com/Randy-420/420Tools" name:@"Github 420Tools Source-Code"];
}

-(void)putBool:(BOOL)setBool forKey:(NSString *) key{
	NSMutableDictionary *preferences;
	preferences = [[NSMutableDictionary alloc] init];

	[preferences setObject:[NSNumber numberWithBool:setBool] forKey: key];
	[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.420tools.plist" atomically:YES];
	[self reloadSpecifiers];
}

-(void)Contact{
	[self putBool:!GetBool(@"contactsOpen", NO, @"com.randy420.420tools") forKey:@"contactsOpen"];
}

-(void)Cdn{
	[self putBool:!GetBool(@"cdnOpen", NO, @"com.randy420.420tools") forKey:@"cdnOpen"];
}

-(void)find{
	[self putBool:!GetBool(@"findMyOpen", NO, @"com.randy420.420tools") forKey:@"findMyOpen"];
}

-(void)special{
	[self putBool:!GetBool(@"specialOpen", NO, @"com.randy420.420tools") forKey:@"specialOpen"];
}

-(void)translate{
	[self putBool:!GetBool(@"translateOpen", NO, @"com.randy420.420tools") forKey:@"translateOpen"];
}
@end