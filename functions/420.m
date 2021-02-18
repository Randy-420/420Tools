#include "420.h"
#define _POSIX_SPAWN_DISABLE_ASLR 0x0100
#define _POSIX_SPAWN_ALLOW_DATA_EXEC 0x2000
extern char **environ;

void Run_CMDDER(const char *cmd) {
	pid_t pid;
	const char *argv[] = {"sh", "-c", cmd, NULL};

	int status;

	status = posix_spawn(&pid, "/bin/sh", NULL, NULL, (char* const*)argv, environ);

	if (status == 0) {
		if (waitpid(pid, &status, 0) != -1) {

		} else {
			perror("waitpid");
		}
	} else {
		
	} 
}
@implementation tai
id CC(NSString *CMD) {
	return [NSString stringWithFormat:@"echo \"%@\" | GaPp",CMD];
}

-(void) RunRoot:(NSString *)RunRoot WaitUntilExit:(BOOL)WaitUntilExit {
	NSString *RunCC = [NSString stringWithFormat:@"%@",CC(RunRoot)];

	NSTask *task = [[NSTask alloc] init];
	NSMutableArray *args = [NSMutableArray array];

	[args addObject:@"-c"];
	[args addObject:RunCC];
	[task setLaunchPath:@"/bin/sh"];
	[task setArguments:args];
	[task launch];
 
	if (WaitUntilExit)
		[task waitUntilExit];
}

-(NSString *) RunRoot:(NSString *)RunRoot {
	NSString *RunCC = [NSString stringWithFormat:@"%@",CC(RunRoot)];
	NSTask *task = [[NSTask alloc] init];
	NSMutableArray *args = [NSMutableArray array];

	[args addObject:@"-c"];
	[args addObject:RunCC];
	[task setLaunchPath:@"/bin/sh"];
	[task setArguments:args];

	NSPipe *outputPipe = [NSPipe pipe];

	[task setStandardInput:[NSPipe pipe]];
	[task setStandardOutput:outputPipe];
	[task launch];
	[task waitUntilExit];

	NSData *outputData = [[outputPipe fileHandleForReading] readDataToEndOfFile];
	NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
 
	return outputString; 
}
-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit { 
	if (WaitUntilExit) {
		NSString *SSHGetFlex = [NSString stringWithFormat:@"%@",RunCMD];

		NSTask *task = [[NSTask alloc] init];
		NSMutableArray *args = [NSMutableArray array];
		
		[args addObject:@"-c"];
		[args addObject:SSHGetFlex];

		[task setLaunchPath:@"/bin/sh"];
		[task setArguments:args];
		[task launch];
		[task waitUntilExit];
	} else {
		NSString *SSHGetFlex = [NSString stringWithFormat:@"%@",RunCMD];

		NSTask *task = [[NSTask alloc] init];
		NSMutableArray *args = [NSMutableArray array];

		[args addObject:@"-c"];
		[args addObject:SSHGetFlex];

		[task setLaunchPath:@"/bin/sh"];
		[task setArguments:args];
		[task launch]; 
	}
}

-(void) RunCMD:(NSString *)RunCMD {
	NSString *CMDFormater = [NSString stringWithFormat:@"%@",RunCMD];
	const char *Run = [CMDFormater UTF8String];
	Run_CMDDER(Run);
}

-(void)makeTweaksFolder {
	NSString *runCode;
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	if (![fileManager fileExistsAtPath : @"/var/mobile/tweaks"]) {
		runCode = [NSString stringWithFormat:@"echo \"mkdir /var/mobile/tweaks\" | GaPp"];
		[self RunCMD:runCode WaitUntilExit: YES] ;
		if ([fileManager fileExistsAtPath : @"/var/mobile/tweaks"]) {
			self.tweaksMade = YES;
			self.folderFailed = NO;
		}
		else {
			self.folderFailed = YES;
			self.tweaksMade = NO;
		}
	}
}

-(BOOL)theosInstall {
	NSString *runCode;
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	self.attempted = YES;
	if (!self.installedTheos && !self.installedVarTheos) {
		self.previousInstall = NO;
		runCode = [NSString stringWithFormat:@"echo \"git clone --recursive https://github.com/theos/theos.git %@\" | GaPp", installHere];
		[self RunCMD:runCode WaitUntilExit: YES] ;
		if ([fileManager fileExistsAtPath : installHere]) {
			self.installSuccess = YES;
			return YES;
		}else {
			self.installSuccess = NO;
			self.failed = YES;
		}
	}
	else {
		self.previousInstall = YES;
	}
	return NO;
}

-(void)loader{
	NSFileManager *fileManager = NSFileManager.defaultManager;
	self.installedTheos = [fileManager fileExistsAtPath : @"/theos"];
	self.installedVarTheos = [fileManager fileExistsAtPath : @"/var/theos"];
	preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"];
	installHere = ([preferences objectForKey:@"Location"] ? [preferences objectForKey:@"Location"] : @"/var/theos");
	self.enhance = ([preferences objectForKey:@"enhance"] ? [[preferences objectForKey:@"enhance"] boolValue] : NO);
	self.all = ([preferences objectForKey:@"sdks-master"] ? [[preferences objectForKey:@"sdks-master"] boolValue] : NO);
	self.nineThree = ([preferences objectForKey:@"9.3"] ? [[preferences objectForKey:@"9.3"] boolValue] : YES);
	self.tenThree = ([preferences objectForKey:@"10.3"] ? [[preferences objectForKey:@"10.3"] boolValue] : NO);
	self.elevenTwo = ([preferences objectForKey:@"11.2"] ? [[preferences objectForKey:@"11.2"] boolValue] : NO);
	self.twelveOneTwo = ([preferences objectForKey:@"12.1.2"] ? [[preferences objectForKey:@"12.1.2"] boolValue] : NO);
	self.twelveFour = ([preferences objectForKey:@"12.4"] ? [[preferences objectForKey:@"12.4"] boolValue] : YES);
	self.thirteen = ([preferences objectForKey:@"13.0"] ? [[preferences objectForKey:@"13.0"] boolValue] : NO);
	self.thirteenFour = ([preferences objectForKey:@"13.4"] ? [[preferences objectForKey:@"13.4"] boolValue] : NO);
	self.thirteenFive = ([preferences objectForKey:@"13.5"] ? [[preferences objectForKey:@"13.5"] boolValue] : YES);
	self.fourteen = ([preferences objectForKey:@"14.0"] ? [[preferences objectForKey:@"14.0"] boolValue] : NO);

	self.tweaksMade = NO;
	self.folderFailed = NO;
	self.enhanced = NO;
	self.alreadyHas = NO;
	self.failure = NO;
	self.theosUpdate = NO;
	self.installSuccess = NO;
	self.previousInstall = YES;
	self.attempted = NO;
	self.failed = NO;
	self.PoPuP = YES;

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
		if (self.installedTheos && self.installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[%sTheos previously installed to '%s/theos%s' & '%s/var/theos%s'%s]\n", c_yellow, c_red, c_yellow, c_red, c_yellow, c_reset];
		} else if (self.installedVarTheos){
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
		if (self.installedTheos && self.installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos' & '/var/theos']\n"];
		} else if (self.installedVarTheos){
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/var/theos']\n"];
		} else {
			previousInstallMsg = [NSString stringWithFormat:@"[Theos previously installed to '/theos']\n"];
		}
	}
	msg = @"";
}

-(bool)sdk:(NSString *)sdk Link:(NSString *)Link {
	NSString *runCode;
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	Loc = [NSString stringWithFormat:@"/theos/sdks/iPhoneOS%s.sdk", [sdk UTF8String]];
	Loc1 = [NSString stringWithFormat:@"/var/theos/sdks/iPhoneOS%s.sdk", [sdk UTF8String]];
	if (![fileManager fileExistsAtPath: Loc] && ![fileManager fileExistsAtPath: Loc1]) {
		runCode = [NSString stringWithFormat:@"echo \"curl -LO %@\" | GaPp;TMP=$(mktemp -d);echo \"unzip %@.zip -d $TMP\" | GaPp;echo \"mv $TMP/*.sdk %@/sdks;echo\" | GaPp;echo \"rm -r %@.zip $TMP\" | GaPp", Link, sdk, installHere, sdk];
		[self RunCMD:runCode WaitUntilExit: YES];
		self.totalDownloaded += 1;
		Loc = [NSString stringWithFormat:@"%@/sdks/iPhoneOS%@.sdk", installHere, sdk];
		if ([fileManager fileExistsAtPath: Loc]) {
			if (self.useColor) {
				successfulSdk = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", successfulSdk, c_green, sdk, c_reset];
			} else {
				successfulSdk = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", successfulSdk, sdk];
			}
			return (YES);
		} else {
			if (self.useColor) {
				failedSdk = [NSString stringWithFormat:@"%@ ~%siPhoneOS %@ SDK%s\n", failedSdk, c_red, sdk, c_reset];
			} else {
				failedSdk = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", failedSdk, sdk];
			}
			self.failure = YES;
			return (NO);
		}
	} else {
		self.alreadyHas = YES;
		if (self.useColor) {
			ignored = [NSString stringWithFormat:@"%@%s ~iPhoneOS %@ SDK%s\n", ignored, c_yellow, sdk, c_reset];
		} else {
			ignored = [NSString stringWithFormat:@"%@ ~iPhoneOS %@ SDK\n", ignored, sdk];
		}
	}
	return (YES);
}

-(void)DoWnLoAd {
	if (self.all) {
		[self sdk:@"9.3" Link:@"https://www.dropbox.com/s/8qhz72yeumz5swy/9.3.zip"];
		[self sdk:@"10.3" Link:@"https://www.dropbox.com/s/fdze31wrnukk3t7/10.3.zip"];
		[self sdk:@"11.2" Link:@"https://www.dropbox.com/s/ak3bjqi4nz0yo0w/11.2.zip"];
		[self sdk:@"12.1.2" Link:@"https://www.dropbox.com/s/2zxfr7qk3fcnm8f/12.1.2.zip"];
		[self sdk:@"12.4" Link:@"https://www.dropbox.com/s/s3dmz4bqx3ayixm/12.4.zip"];
		[self sdk:@"13.0" Link:@"https://www.dropbox.com/s/fujs52jmc6vdh37/13.0.zip"];
		[self sdk:@"13.4" Link:@"https://www.dropbox.com/s/hxtkxy9c1fu71nq/13.4.zip"];
		[self sdk:@"13.5" Link:@"https://www.dropbox.com/s/ztqcfo7okv6276p/13.5.zip"];
		[self sdk:@"14.0" Link:@"https://www.dropbox.com/s/ly8627ncpaiv6ji/14.0.zip"];
	}else{
		self.nineThree ? [self sdk:@"9.3" Link:@"https://www.dropbox.com/s/8qhz72yeumz5swy/9.3.zip"] : 0;
		self.tenThree ? [self sdk:@"10.3" Link:@"https://www.dropbox.com/s/fdze31wrnukk3t7/10.3.zip"] : 0;
		self.elevenTwo ? [self sdk:@"11.2" Link:@"https://www.dropbox.com/s/ak3bjqi4nz0yo0w/11.2.zip"] : 0;
		self.twelveOneTwo ? [self sdk:@"12.1.2" Link:@"https://www.dropbox.com/s/2zxfr7qk3fcnm8f/12.1.2.zip"] : 0;
		self.twelveFour ? [self sdk:@"12.4" Link:@"https://www.dropbox.com/s/s3dmz4bqx3ayixm/12.4.zip"] : 0;
		self.thirteen ? [self sdk:@"13.0" Link:@"https://www.dropbox.com/s/fujs52jmc6vdh37/13.0.zip"] : 0;
		self.thirteenFour ? [self sdk:@"13.4" Link:@"https://www.dropbox.com/s/hxtkxy9c1fu71nq/13.4.zip"] : 0;
		self.thirteenFive ? [self sdk:@"13.5" Link:@"https://www.dropbox.com/s/ztqcfo7okv6276p/13.5.zip"] : 0;
		self.fourteen ? [self sdk:@"14.0" Link:@"https://www.dropbox.com/s/ly8627ncpaiv6ji/14.0.zip"] : 0;
	}
}

-(void)upDateTheos {
	[self RunCMD: @"echo \"$THEOS/bin/update-theos\" | GaPp" WaitUntilExit: YES];
	self.theosUpdate = YES;
}

-(void)enhancer{
	NSString *runCode;
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	if (self.enhance){
		if ([fileManager fileExistsAtPath:installHere]) {
			runCode = [NSString stringWithFormat:@"echo \"curl -LO https://www.dropbox.com/s/ya3i2fft4dqvccm/includes.zip\" | GaPp;TMP=$(mktemp -d);echo \"unzip includes.zip -d $TMP\" | GaPp;echo \"mv $TMP/include/* /theos/include\" | GaPp;echo \"mv $TMP/lib/* %@/lib\" | GaPp;echo \"mv $TMP/templates/* %@/templates\" | GaPp;echo \"mv $TMP/vendor/* %@/vendor\" | GaPp;echo;echo \"rm -r includes.zip $TMP\" | GaPp;", installHere, installHere, installHere];
			[self RunCMD:runCode WaitUntilExit: YES];
		}
		if ([fileManager fileExistsAtPath:@"/theos/vendor/templates/test.sh"] || [fileManager fileExistsAtPath:@"/var/theos/vendor/templates/test.sh"]){
			self.enhanced = YES;
		}
	}
}

-(void)addMsg: (NSString *)mSg{
	msg = [NSString stringWithFormat:@"%@%@\n", msg, mSg];
}

-(void)popup{
	self.theosUpdate ? [self addMsg:updated] : 0;
	self.installSuccess ? [self addMsg:theosSuccessMessage] : 0;
	if (!self.theosUpdate) {
		if (!self.folderFailed && self.tweaksMade) {
			 [self addMsg:tFolderSuc];
		} else if (self.folderFailed && !self.tweaksMade) {
			[self addMsg:tFolderFail];
		} else if (!self.folderFailed && !self.tweaksMade) {
		 [self addMsg:tFolderIgnore];
		}
	}
	if (self.attempted && self.failed && (!(self.previousInstall && self.installSuccess))) {
		[self addMsg:theosFailureMessage];
	}
	if (self.attempted && self.previousInstall){
		[self addMsg:previousInstallMsg];
	}

	self.enhanced ? [self addMsg:enhanceMsg] : 0;

	if (self.totalDownloaded >= 1){
		[self addMsg:successfulSdk];
	}
	self.alreadyHas ? [self addMsg:ignored] : 0;

	if (self.failure) {
		[self addMsg:failedSdk];
		[self addMsg:checkInstall];
	}

	if (self.PoPuP) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Installation Results" message: msg preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		
		}];
		[alert addAction:action];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
	} else {
		printf("\n\n%s\n", [msg UTF8String]);
	}
}
@end