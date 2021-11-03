#include "taiRootListController.h"
#include "../functions/profileHelper.h"
#include "../functions/.profile.h"
#include "../functions/.zprofile.h"

@implementation taiprRootListController
- (instancetype)init{
	myIcon = @"taihead";
	myTitle = @"Theos Auto Installer";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	fm = [[NSFileManager alloc] init];
	TAI = [[tai alloc] init];
	self.plistName = @"Tai";
	self.chosenIDs = @[@"eightFour", @"nineThree", @"ten", @"tenThree", @"eleven", @"elevenOne", @"elevenTwo", @"elevenThree", @"elevenFour", @"twelveOneTwo", @"twelveTwo", @"twelveFour", @"thirteen", @"thirteenTwo", @"thirteenFour", @"thirteenFive", @"fourteen", @"fourteenOne", @"fourteenTwo", @"fourteenThree", @"fourteenFour", @"fourteenFive", @"bottom", @"top", @"load", @"Full", @"Update", @"Sdks", @"installLoc", @"theos", @"varTheos", @"Note"];
	[TAI loader];
	return [super specifiers];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[super scrollViewDidScroll:scrollView];
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier{
	[super setPreferenceValue:value specifier:specifier];
	[TAI loader];

	NSString *key = [specifier propertyForKey:@"key"];

	[self hideMe:@"top" animate:NO];
	[self hideMe:@"bottom" animate:NO];
	[self hideMe:@"load" animate:NO];

	if ([key isEqualToString:@"Location"]){
		NSMutableDictionary *preferences;
		if ([fm fileExistsAtPath:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"]) {
			preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"];
		} else {
			preferences = [[NSMutableDictionary alloc] init];
		}
		if ([TAI installedTheos]){
			[preferences setObject:@"/theos" forKey: @"Location"];
		} else if ([TAI installedVarTheos]){
			[preferences setObject:@"/var/theos" forKey: @"Location"];
		}
		[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist" atomically:YES];

		[self reloadSpecifiers];
	}

	if([key isEqualToString:@"sdks-master"]){
		if([value boolValue]){
			[self hideMe:@"eightFour" animate:YES];
			[self hideMe:@"nineThree" animate:YES];
			[self hideMe:@"ten" animate:YES];
			[self hideMe:@"tenThree" animate:YES];
			[self hideMe:@"eleven" animate:YES];
			[self hideMe:@"elevenOne" animate:YES];
			[self hideMe:@"elevenTwo" animate:YES];
			[self hideMe:@"elevenThree" animate:YES];
			[self hideMe:@"elevenFour" animate:YES];
			[self hideMe:@"twelveOneTwo" animate:YES ];
			[self hideMe:@"twelveTwo" animate:YES];
			[self hideMe:@"twelveFour" animate:YES];
			[self hideMe:@"thirteen" animate:YES];
			[self hideMe:@"thirteenTwo" animate:YES];
			[self hideMe:@"thirteenFour" animate:YES];
			[self hideMe:@"thirteenFive" animate:YES];
			[self hideMe:@"fourteen" animate:YES];
			[self hideMe:@"fourteenOne" animate:YES];
			[self hideMe:@"fourteenTwo" animate:YES];
			[self hideMe:@"fourteenThree" animate:YES];
			[self hideMe:@"fourteenFour" animate:YES];
			[self hideMe:@"fourteenFive" animate:YES];
		} else{
			[self showMe:@"fourteenFive" after:@"All" animate:YES];
			[self showMe:@"fourteenFour" after:@"All" animate:YES];
			[self showMe:@"fourteenThree" after:@"All" animate:YES];
			[self showMe:@"fourteenTwo" after:@"All" animate:YES];
			[self showMe:@"fourteenOne" after:@"All" animate:YES];
			[self showMe:@"fourteen" after:@"All" animate:YES];
			[self showMe:@"thirteenFive" after:@"All" animate:YES];
			[self showMe:@"thirteenFour" after:@"All" animate:YES];
			[self showMe:@"thirteenTwo" after:@"All" animate:YES];
			[self showMe:@"thirteen" after:@"All" animate:YES];
			[self showMe:@"twelveFour" after:@"All" animate:YES];
			[self showMe:@"twelveTwo" after:@"All" animate:YES];
			[self showMe:@"twelveOneTwo" after:@"All" animate:YES];
			[self showMe:@"elevenFour" after:@"All" animate:YES];
			[self showMe:@"elevenThree" after:@"All" animate:YES];
			[self showMe:@"elevenTwo" after:@"All" animate:YES];
			[self showMe:@"elevenOne" after:@"All" animate:YES];
			[self showMe:@"eleven" after:@"All" animate:YES];
			[self showMe:@"tenThree" after:@"All" animate:YES];
			[self showMe:@"ten" after:@"All" animate:YES];
			[self showMe:@"nineThree" after:@"All" animate:YES];
			[self showMe:@"eightFour" after:@"All" animate:YES];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	[TAI loader];

		NSMutableDictionary *preferences;
		if ([fm fileExistsAtPath:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"]) {
			preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"];
		} else {
			preferences = [[NSMutableDictionary alloc] init];
		}
		if ([TAI installedTheos]){
			[preferences setObject:@"/theos" forKey: @"Location"];
			[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist" atomically:YES];
		} else if ([TAI installedVarTheos]){
			[preferences setObject:@"/var/theos" forKey: @"Location"];
			[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist" atomically:YES];
		}

	[self hideMe:@"top" animate:NO];
	[self hideMe:@"bottom" animate:NO];
	[self hideMe:@"load" animate:NO];

	if (![fm fileExistsAtPath:@"/theos"])
		[self hideMe:@"theos" animate:NO];

	if (![fm fileExistsAtPath:@"/var/theos"])
		[self hideMe:@"varTheos" animate:NO];

	if(TAI.all){
		[self hideMe:@"eightFour" animate:YES];
		[self hideMe:@"nineThree" animate:YES];
		[self hideMe:@"ten" animate:YES];
		[self hideMe:@"tenThree" animate:YES];
		[self hideMe:@"eleven" animate:YES];
		[self hideMe:@"elevenOne" animate:YES];
		[self hideMe:@"elevenTwo" animate:YES];
		[self hideMe:@"elevenThree" animate:YES];
		[self hideMe:@"elevenFour" animate:YES];
		[self hideMe:@"twelveOneTwo" animate:YES ];
		[self hideMe:@"twelveTwo" animate:YES];
		[self hideMe:@"twelveFour" animate:YES];
		[self hideMe:@"thirteen" animate:YES];
		[self hideMe:@"thirteenTwo" animate:YES];
		[self hideMe:@"thirteenFour" animate:YES];
		[self hideMe:@"thirteenFive" animate:YES];
		[self hideMe:@"fourteen" animate:YES];
		[self hideMe:@"fourteenOne" animate:YES];
		[self hideMe:@"fourteenTwo" animate:YES];
		[self hideMe:@"fourteenThree" animate:YES];
		[self hideMe:@"fourteenFour" animate:YES];
		[self hideMe:@"fourteenFive" animate:YES];
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
	[self pOpup:@"SDKS & HEADERS" cmd:1];
}

-(void) fullDl{
	[self pOpup:@"FULL THEOS INSTALL" cmd:2];
}

-(void) updateTheos{
	[self pOpup:@"UPDATE THEOS" cmd:3];
}

-(void)pOpup:(NSString *)pOpup cmd:(int)cmd{
	pOpup = [NSString stringWithFormat:@"%@\n\nThis action requires an internet connection! Due to the amount of possible data usage, it is recommended to connect to WIFI for this.", pOpup];
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Theos Auto Installer" message: pOpup preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"Later" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		
	}];
	[alert addAction:action];
	action = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		[TAI loader];
		int CMD = cmd;
		if (![TAI toolsInstalled]){
			[TAI addMsg:@"[Please install Theos Auto Installer from BigBoss repo to use this feature.]"];
			CMD = 0;
		}
		if (CMD == 1){
			[self showMe:@"top" after:@"Note" animate:NO];
			[self showMe:@"load" after:@"top" animate:NO];
			[self showMe:@"bottom" after:@"load" animate:NO];
			[self hideMe:@"Sdks" animate:NO];
			[TAI enhancer];
			[TAI DoWnLoAd];
			[self showMe:@"Sdks" after:@"Note" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
			[self hideMe:@"load" animate:NO];
		}

		if (CMD == 2){
			[self showMe:@"top" after:@"Full" animate:NO];
			[self showMe:@"load" after:@"top" animate:NO];
			[self showMe:@"bottom" after:@"load" animate:NO];
			[self hideMe:@"Full" animate:NO];

			if ([TAI theosInstall]){
				Profile(YES);
				zProfile(YES);
			}
			![TAI tweaksExists] ? [TAI makeTweaksFolder] : 0;
			[TAI enhancer];
			[TAI DoWnLoAd];
			[self showMe:@"Full" after:@"Sdks" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
			[self hideMe:@"load" animate:NO];
		}

		if (CMD ==3){
			[self showMe:@"top" after:@"Update" animate:NO];
			[self showMe:@"load" after:@"top" animate:NO];
			[self showMe:@"bottom" after:@"load" animate:NO];
			[self hideMe:@"Update" animate:NO];
			[TAI upDateTheos];
			[self showMe:@"Update" after:@"Full" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
			[self hideMe:@"load" animate:NO];
		}
		[TAI popup];
	}];
	[alert addAction:action];

	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}
@end

@implementation tai
-(void)RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit { 
	NSString *SSHGetFlex = [NSString stringWithFormat:@"%@",RunCMD];

	NSTask *task = [[NSTask alloc] init];
	NSMutableArray *args = [NSMutableArray array];

	[args addObject:@"-c"];
	[args addObject:SSHGetFlex];

	[task setLaunchPath:@"/bin/sh"];
	[task setArguments:args];
	[task launch];

	if (WaitUntilExit)
		[task waitUntilExit];
}

-(void)makeTweaksFolder {
	NSFileManager *fm = [[NSFileManager alloc] init];

	if (![fm fileExistsAtPath:@"/var/mobile/tweaks"]) {
		runCode = [NSString stringWithFormat:@"echo \"mkdir /var/mobile/tweaks\" | gap"];
		[self RunCMD:runCode WaitUntilExit: YES] ;

		self.tweaksMade = [fm fileExistsAtPath:@"/var/mobile/tweaks"];
		self.folderFailed = !self.tweaksMade;
	}
}

-(BOOL)theosInstall {
	self.attempted = YES;
	if (!self.previousInstall) {
		runCode = [NSString stringWithFormat:@"echo \"git clone --recursive https://github.com/theos/theos.git %@\" | gap", installHere];
		[self RunCMD:runCode WaitUntilExit: YES] ;
		self.installSuccess = [[NSFileManager defaultManager] fileExistsAtPath:installHere];

		if (self.installSuccess)
			return YES;

		self.failed = YES;
	}
	return NO;
}

-(void)loader{
	NSFileManager *fm = NSFileManager.defaultManager;

	installHere = GetNSString(@"Location", @"/var/theos", @"com.randy420.tai");

	self.enhance = GetBool(@"enhance", NO, @"com.randy420.tai");
	self.all = GetBool(@"sdks-master", NO, @"com.randy420.tai");
	self.eightFour = GetBool(@"8.4", NO, @"com.randy420.tai");
	self.nineThree = GetBool(@"9.3", YES, @"com.randy420.tai");
	self.ten = GetBool(@"10.0", NO, @"com.randy420.tai");
	self.tenThree = GetBool(@"10.3", NO, @"com.randy420.tai");
	self.eleven = GetBool(@"11.0", NO, @"com.randy420.tai");
	self.elevenOne = GetBool(@"11.1", NO, @"com.randy420.tai");
	self.elevenTwo = GetBool(@"11.2", NO, @"com.randy420.tai");
	self.elevenThree = GetBool(@"11.3", NO, @"com.randy420.tai");
	self.elevenFour = GetBool(@"11.4", NO, @"com.randy420.tai");
	self.twelveOneTwo = GetBool(@"12.1.2", NO, @"com.randy420.tai");
	self.twelveTwo = GetBool(@"12.2", NO, @"com.randy420.tai");
	self.twelveFour = GetBool(@"12.4", YES, @"com.randy420.tai");
	self.thirteen = GetBool(@"13.0", NO, @"com.randy420.tai");
	self.thirteenTwo = GetBool(@"13.2", NO, @"com.randy420.tai");
	self.thirteenFour = GetBool(@"13.4", NO, @"com.randy420.tai");
	self.thirteenFive = GetBool(@"13.5", YES, @"com.randy420.tai");
	self.fourteen = GetBool(@"14.0", NO, @"com.randy420.tai");
	self.fourteenOne = GetBool(@"14.1", NO, @"com.randy420.tai");
	self.fourteenTwo = GetBool(@"14.2", NO, @"com.randy420.tai");
	self.fourteenThree = GetBool(@"14.3", NO, @"com.randy420.tai");
	self.fourteenFour = GetBool(@"14.4", NO, @"com.randy420.tai");
	self.fourteenFive = GetBool(@"14.5", NO, @"com.randy420.tai");

	self.installedTheos = [fm fileExistsAtPath:@"/theos"];
	self.installedVarTheos = [fm fileExistsAtPath:@"/var/theos"];
	self.tweaksExists = [fm fileExistsAtPath:@"/var/mobile/tweaks"];
	self.toolsInstalled = [fm fileExistsAtPath:@"/usr/bin/tai"];

	self.tweaksMade = NO;
	self.folderFailed = NO;
	self.enhanced = NO;
	self.alreadyHas = NO;
	self.failure = NO;
	self.theosUpdate = NO;
	self.installSuccess = NO;
	self.attempted = NO;
	self.failed = NO;
	self.PoPuP = YES;
	self.previousInstall = (self.installedTheos || self.installedVarTheos);
	self.totalDownloaded = 0;

	if (self.useColor) {
		successfulSdk = [NSString stringWithFormat:@"[%sSuccessfully downloaded SDKS%s]\n", c_green, c_reset];
		failedSdk = [NSString stringWithFormat:@"[%sFailed Installing SDKS%s]\n", c_red, c_reset];
		enhanceMsg = [NSString stringWithFormat:@"[%sDev Tools Installed%s]\n", c_green, c_reset];
		ignored = [NSString stringWithFormat:@"[%sPreviously installed SDKS%s]\n", c_yellow, c_reset];
		tFolderSuc = [NSString stringWithFormat:@"[%sTweaks folder created successfully%s]\n", c_green, c_reset];
		tFolderFail = [NSString stringWithFormat:@"[%sFailed to make /var/mobile/tweaks%s]\n", c_red, c_reset];
		tFolderIgnore = [NSString stringWithFormat:@"[%stweaks folder already exists%s]\n", c_yellow, c_reset];
		updated = [NSString stringWithFormat:@"[%sTheos is now Up-To-Date%s]\n", c_green, c_reset];
		theosFailureMessage = [NSString stringWithFormat:@"[%sTheos install FAILED!%s]\n", c_red, c_reset];
		theosSuccessMessage = [NSString stringWithFormat:@"[%sTheos installed To '%@'%s]\n", c_green, installHere, c_reset];
		checkInstall = [NSString stringWithFormat:@"[%s!!%sMAKE SURE THE INSTALL LOCATION IS RIGHT IN SETTINGS%s!!%s]\n", c_cyan, c_red, c_cyan, c_reset];
		if (self.installedTheos && self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s' & '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_red, c_yellow, c_reset];
		} else if (self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_reset];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_reset];
		}
	} else {
		successfulSdk = @"[Successfully downloaded SDKS]\n";
		failedSdk = @"[Failed Installing SDKS]\n";
		enhanceMsg = @"[Dev Tools Installed]\n";
		checkInstall = @"[!!MAKE SURE THE INSTALL LOCATION IS RIGHT IN SETTINGS!!]\n";
		ignored = @"[Ignored Previously Installed SDKS]\n";
		tFolderSuc = @"[Tweaks folder created successfully]\n";
		tFolderFail = @"[Failed to make /var/mobile/tweaks]\n";
		tFolderIgnore = @"[tweaks folder already exists]\n";
		updated = @"[Theos is now Up-To-Date]\n";
		theosFailureMessage = @"[Theos install FAILED!]\n";
		theosSuccessMessage = [NSString stringWithFormat:@"[Theos installed To '%@']\n", installHere];
		if (self.installedTheos && self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos' & '/var/theos']\n"];
		} else if (self.installedVarTheos) {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/var/theos']\n"];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos']\n"];
		}
	}
	msg = @"";
}

-(void)sdk:(NSString *)sdk Link:(NSString *)Link {
	NSFileManager *fm = [[NSFileManager alloc] init];
	Link = [NSString stringWithFormat:@"https://dropbox.com/s/%@/%@.zip", Link, sdk];
	Loc = [NSString stringWithFormat:@"%@/sdks/iPhoneOS%@.sdk", installHere, sdk];
	if (![fm fileExistsAtPath:Loc]) {
		runCode = [NSString stringWithFormat:@"echo \"curl -LO %@\" | gap;TMP=$(mktemp -d);echo \"unzip %@.zip -d $TMP\" | gap;echo \"mv $TMP/*.sdk %@/sdks;echo\" | gap;echo \"rm -r %@.zip $TMP\" | gap", Link, sdk, installHere, sdk];
		[self RunCMD:runCode WaitUntilExit: YES];
		self.totalDownloaded += 1;
		if ([fm fileExistsAtPath: Loc]) {
			if (self.useColor) {
				successfulSdk = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", successfulSdk, c_green, sdk, c_reset];
			} else {
				successfulSdk = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", successfulSdk, sdk];
			}
		} else {
			if (self.useColor) {
				failedSdk = [NSString stringWithFormat:@"%@ ~%siPhoneOS %@ SDK%s\n", failedSdk, c_red, sdk, c_reset];
			} else {
				failedSdk = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", failedSdk, sdk];
			}
			self.failure = YES;
		}
	} else {
		self.alreadyHas = YES;
		ignored = self.useColor ? [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", ignored, c_yellow, sdk, c_reset] : [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", ignored, sdk];
	}
}

-(void)DoWnLoAd {
	if (self.all) {
		[self sdk:@"8.4" Link:@"pt9xa1cxf7tbiu5"];
		[self sdk:@"9.3" Link:@"8qhz72yeumz5swy"];
		[self sdk:@"10.0" Link:@"19vezfdtnp074kt"];
		[self sdk:@"10.3" Link:@"fdze31wrnukk3t7"];
		[self sdk:@"11.0" Link:@"hwg97eqgskbyyr1"];
		[self sdk:@"11.1" Link:@"m7n5iflnt2b0a46"];
		[self sdk:@"11.2" Link:@"ak3bjqi4nz0yo0w"];
		[self sdk:@"11.3" Link:@"taxziihftkm1z4d"];
		[self sdk:@"11.4" Link:@"l0r7yz0ggffb0zn"];
		[self sdk:@"12.1.2" Link:@"2zxfr7qk3fcnm8f"];
		[self sdk:@"12.2" Link:@"l85lp0lbrztbdun"];
		[self sdk:@"12.4" Link:@"s3dmz4bqx3ayixm"];
		[self sdk:@"13.0" Link:@"fujs52jmc6vdh37"];
		[self sdk:@"13.2" Link:@"wq1ri0gtxk3ofww"];
		[self sdk:@"13.4" Link:@"hxtkxy9c1fu71nq"];
		[self sdk:@"13.5" Link:@"ztqcfo7okv6276p"];
		[self sdk:@"14.0" Link:@"ly8627ncpaiv6ji"];
		[self sdk:@"14.1" Link:@"jvonok3de24ibsz"];
		[self sdk:@"14.2" Link:@"71n5fslaz5uiwc3"];
		[self sdk:@"14.3" Link:@"ggydf4vh3kwafdi"];
		[self sdk:@"14.4" Link:@"d47tnjb1cfizj61"];
		[self sdk:@"14.5" Link:@"t10nazl6vo20ya7"];
		return;
	}
	self.eightFour ? [self sdk:@"8.4" Link:@"pt9xa1cxf7tbiu5"] : 0;
	self.nineThree ? [self sdk:@"9.3" Link:@"8qhz72yeumz5swy"] : 0;
	self.ten ? [self sdk:@"10.0" Link:@"19vezfdtnp074kt"] : 0;
	self.tenThree ? [self sdk:@"10.3" Link:@"fdze31wrnukk3t7"] : 0;
	self.eleven ? [self sdk:@"11.0" Link:@"hwg97eqgskbyyr1"] : 0;
	self.elevenOne ? [self sdk:@"11.1" Link:@"m7n5iflnt2b0a46"] : 0;
	self.elevenTwo ? [self sdk:@"11.2" Link:@"ak3bjqi4nz0yo0w"] : 0;
	self.elevenThree ? [self sdk:@"11.3" Link:@"taxziihftkm1z4d"] : 0;
	self.elevenFour ? [self sdk:@"11.4" Link:@"l0r7yz0ggffb0zn"] : 0;
	self.twelveOneTwo ? [self sdk:@"12.1.2" Link:@"2zxfr7qk3fcnm8f"] : 0;
	self.twelveTwo ? [self sdk:@"12.2" Link:@"l85lp0lbrztbdun"] : 0;
	self.twelveFour ? [self sdk:@"12.4" Link:@"s3dmz4bqx3ayixm"] : 0;
	self.thirteen ? [self sdk:@"13.0" Link:@"fujs52jmc6vdh37"] : 0;
	self.thirteenTwo ? [self sdk:@"13.2" Link:@"wq1ri0gtxk3ofww"] : 0;
	self.thirteenFour ? [self sdk:@"13.4" Link:@"hxtkxy9c1fu71nq"] : 0;
	self.thirteenFive ? [self sdk:@"13.5" Link:@"ztqcfo7okv6276p"] : 0;
	self.fourteen ? [self sdk:@"14.0" Link:@"ly8627ncpaiv6ji"] : 0;
	self.fourteenOne ? [self sdk:@"14.1" Link:@"jvonok3de24ibsz"] : 0;
	self.fourteenTwo ? [self sdk:@"14.2" Link:@"71n5fslaz5uiwc3"] : 0;
	self.fourteenThree ? [self sdk:@"14.3" Link:@"ggydf4vh3kwafdi"] : 0;
	self.fourteenFour ? [self sdk:@"14.4" Link:@"d47tnjb1cfizj61"] : 0;
	self.fourteenFive ? [self sdk:@"14.5" Link:@"t10nazl6vo20ya7"] : 0;
}

-(void)upDateTheos {
	[self RunCMD: @"echo \"$THEOS/bin/update-theos\" | gap" WaitUntilExit: YES];
	self.theosUpdate = YES;
}

-(void)enhancer{
	NSFileManager *fm = [[NSFileManager alloc] init];
	if (self.enhance) {
		if ([fm fileExistsAtPath:installHere]) {
			runCode = [NSString stringWithFormat:@"echo \"curl -LO https://www.dropbox.com/s/ya3i2fft4dqvccm/includes.zip\" | gap;TMP=$(mktemp -d);echo \"unzip includes.zip -d $TMP\" | gap;echo \"cp -rf $TMP/include/* %@/include\" | gap;echo \"cp -rf $TMP/lib/* %@/lib\" | gap;echo \"cp -rf $TMP/templates/* %@/templates\" | gap;echo \"cp -rf $TMP/vendor/* %@/vendor\" | gap;echo;echo \"rm -r includes.zip $TMP\" | gap;", installHere, installHere, installHere, installHere];

			[self RunCMD:runCode WaitUntilExit: YES];
		}
		if ([fm fileExistsAtPath:@"/theos/vendor/templates/test.sh"] || [fm fileExistsAtPath:@"/var/theos/vendor/templates/test.sh"]) {
			self.enhanced = YES;
		}
	}
}

-(void)addMsg:(NSString *)mSg{
	msg = [NSString stringWithFormat:@"%@%@\n", msg, mSg];
}

-(void)popup{
	self.theosUpdate ? [self addMsg:updated] : 0;
	self.installSuccess ? [self addMsg:theosSuccessMessage] : 0;
	if (self.tweaksExists && self.toolsInstalled){
		[self addMsg:tFolderIgnore];
	}else if (!self.theosUpdate && self.toolsInstalled) {
			self.tweaksMade ? [self addMsg:tFolderSuc] : (self.folderFailed ? [self addMsg:tFolderFail] : 0);
	}
	(self.attempted && self.failed && (!(self.previousInstall && self.installSuccess))) ? [self addMsg:theosFailureMessage] : 0;

	(self.attempted && self.previousInstall) ? [self addMsg:previousInstallMsg] : 0;

	self.enhanced ? [self addMsg:enhanceMsg] : 0;

	(self.totalDownloaded >= 1) ? [self addMsg:successfulSdk] : 0;

	self.alreadyHas ? [self addMsg:ignored] : 0;

	if (self.failure) {
		[self addMsg:failedSdk];
		[self addMsg:checkInstall];
	}

	if (self.PoPuP) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Installation Results" message: msg preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		
		}];
		[alert addAction:action];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
	} else {
		printf("\n\n%s\n", [msg UTF8String]);
	}
}
@end