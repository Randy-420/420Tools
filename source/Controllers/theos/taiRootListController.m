#include "taiRootListController.h"
//#include "../../functions/profileHelper.h"
//#include "../../functions/.profile.h"
//#include "../../functions/.zprofile.h"
//#import <MobileCoreServices/UTCoreTypes.h>

@implementation taiprRootListController
- (instancetype)init{
	myIcon = @"taihead";
	myTitle = @"Theos Auto Installer";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	fm = [[NSFileManager alloc] init];
	self.plistName = @"Tai";
	self.chosenIDs = @[@"top", @"bottom", @"load", @"Full", @"Update", @"Sdks", @"theos", @"varTheos", @"Note", @"fix", @"divFix", @"optTheos"];
	[self upDate];
	return [super specifiers];
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier{
	[super setPreferenceValue:value specifier:specifier];

	[self hideMe:@"top" animate:NO];
	[self hideMe:@"bottom" animate:NO];
	[self hideMe:@"load" animate:NO];
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];
	[self upDate];

	[self hideMe:@"top" animate:NO];
	[self hideMe:@"bottom" animate:NO];
	[self hideMe:@"load" animate:NO];

	if (![fm fileExistsAtPath:@"/theos"])
		[self hideMe:@"theos" animate:NO];

	if (![fm fileExistsAtPath:@"/var/theos"])
		[self hideMe:@"varTheos" animate:NO];

	if (![fm fileExistsAtPath:@"/opt/theos"])
		[self hideMe:@"optTheos" animate:NO];
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

-(void)fixFakeRoot{
	[self pOpup:@"Fix Theos" cmd:4];
}

-(void)pOpup:(NSString *)pOpup cmd:(int)cmd{
	if (cmd != 4){
		pOpup = [NSString stringWithFormat:@"%@\n\nThis action requires an internet connection! Due to the amount of possible data usage, it is recommended to connect to WIFI for this.", pOpup];
	}else{
		pOpup = [NSString stringWithFormat:@"%@\n\nThis action is only needed if you're having issues with fakeroot.sh", pOpup];
	}

	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Theos Auto Installer" message: pOpup preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"Later" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		
	}];
	[alert addAction:action];
	action = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		int CMD = cmd;
		if (![fm fileExistsAtPath:@"/usr/bin/tai"]){
			[self results:@"[Please install Theos Auto Installer from BigBoss repo to use this feature.]"];
			return;
		}
		if (CMD == 1){
			[self showMe:@"top" after:@"Note" animate:NO];
			[self showMe:@"load" after:@"top" animate:NO];
			[self showMe:@"bottom" after:@"load" animate:NO];
			[self hideMe:@"Sdks" animate:NO];

			[self results:[self RunCMD:@"tai -~s" WaitUntilExit:YES]];

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

			[self results:[self RunCMD:@"tai -~" WaitUntilExit:YES]];

			[self showMe:@"Full" after:@"Sdks" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
			[self hideMe:@"load" animate:NO];
		}

		if (CMD == 3){
			[self showMe:@"top" after:@"Update" animate:NO];
			[self showMe:@"load" after:@"top" animate:NO];
			[self showMe:@"bottom" after:@"load" animate:NO];
			[self hideMe:@"Update" animate:NO];

			[self results:[self RunCMD:@"tai -~v" WaitUntilExit:YES]];

			[self showMe:@"Update" after:@"Full" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
			[self hideMe:@"load" animate:NO];
		}
		if (CMD == 4){
			[self showMe:@"top" after:@"fix" animate:NO];
			[self showMe:@"bottom" after:@"top" animate:NO];
			[self hideMe:@"fix" animate:NO];

			[self results:[self RunCMD:@"tai -~f" WaitUntilExit:YES]];

			[self showMe:@"fix" after:@"divFix" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
		}
	}];
	[alert addAction:action];

	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

-(void)results:(NSString *)results{
//	NSString *leaf = @"\n\n                     .                          \n                     M                          \n                    dM                          \n                    MMr                         \n                   4MMML                  .     \n                   MMMMM.                xf     \n   .              \"MMMMM               .MM-     \n    Mh..          +MMMMMM            .MMMM      \n    .MMM.         .MMMMML.          MMMMMh      \n     )MMMh.        MMMMMM         MMMMMMM       \n      3MMMMx.     \'MMMMMMf      xnMMMMMM\"       \n      \'*MMMMM      MMMMMM.     nMMMMMMP\"        \n        *MMMMMx    \"MMMMM\\    .MMMMMMM=         \n         *MMMMMh   \"MMMMM\"   JMMMMMMP           \n           MMMMMM   3MMMM.  dMMMMMM            .\n            MMMMMM  \"MMMM  .MMMMM(        .nnMP\"\n=..          *MMMMx  MMM\"  dMMMM\"    .nnMMMMM*  \n  \"MMn...     \'MMMMr \'MM   MMM\"   .nMMMMMMM*\"   \n   \"4MMMMnn..   *MMM  MM  MMP\"  .dMMMMMMM\"\"     \n     ^MMMMMMMMx.  *ML \"M .M*  .MMMMMM**\"        \n        *PMMMMMMhn. *x > M  .MMMM**\"\"           \n           \"\"**MMMMhx/.h/ .=*\"                  \n                    .3P\"%....";

/*	NSArray *Remove = @[leaf, @"\x1B[30m", @"\x1B[31m", @"\x1B[32m", @"\x1B[33m", @"\x1B[34m", @"\x1B[35m", @"\x1B[36m", @"\x1B[37m", @"\x1B[0m", @"\x1B[1m", @"\x1B[3m", @"\x1B[7m", @"  ", @"\t", @"\n\n\n", @" Theos Auto Installer", @" Theos Auto Installer\n", @"Theos Auto Installer\n", @"Theos Auto Installer", @"Randy420\n", @"Randy420", @"\n\n \n\n\n \n", @"\n\n "];

	int i;
	for (i = 0; i < [Remove count]; i++){
		results = [results stringByReplacingOccurrencesOfString:Remove[i] withString:@""];
	}*/

	//[UIPasteboard.generalPasteboard setValue:results forPasteboardType:(id)kUTTypeUTF8PlainText];

	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Theos Auto Installer" message: results preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		
	}];
	[alert addAction:action];
	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

-(void)upDate{
	NSMutableDictionary *preferences;
	if ([fm fileExistsAtPath:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"]) {
		preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist"];
	} else {
		preferences = [[NSMutableDictionary alloc] init];
	}

	if ([fm fileExistsAtPath:@"/theos"]){
		[preferences setObject:@"/theos" forKey: @"Location"];
	} else if ([fm fileExistsAtPath:@"/var/theos"]){
		[preferences setObject:@"/var/theos" forKey: @"Location"];
	}
	[preferences writeToFile:@"/var/mobile/Library/Preferences/com.randy420.tai.plist" atomically:YES];
}

-(void)source{
	[self link:@"https://github.com/Randy-420/Theos-Auto-Installer-u0-Checkra1n-odyssey" name:@"Github Theos Auto Installer Source-Code"];
}
@end