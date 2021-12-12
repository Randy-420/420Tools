#include "taiRootListController.h"
#include "../../functions/profileHelper.h"
#include "../../functions/.profile.h"
#include "../../functions/.zprofile.h"
#import <MobileCoreServices/UTCoreTypes.h>

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
	self.chosenIDs = @[@"top", @"bottom", @"topGroup", @"load", @"Full", @"Update", @"Sdks", @"installLoc", @"theos", @"varTheos", @"Note", @"fix", @"divFix"];
	[self upDate];
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

	if ([fm fileExistsAtPath:@"/theos"] || [fm fileExistsAtPath:@"/var/theos"])
		[self hideMe:@"installLoc" animate:NO];
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
	return [super readPreferenceValue:specifier];
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

			[self results:[self RunCMD:@"tai -.~s" WaitUntilExit:YES]];

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

			[self results:[self RunCMD:@"tai -.~" WaitUntilExit:YES]];

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

			[self results:[self RunCMD:@"tai -.~v" WaitUntilExit:YES]];

			[self showMe:@"Update" after:@"Full" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
			[self hideMe:@"load" animate:NO];
		}
		if (CMD == 4){
			[self showMe:@"top" after:@"fix" animate:NO];
			[self showMe:@"bottom" after:@"top" animate:NO];
			[self hideMe:@"fix" animate:NO];

			[self results:[self RunCMD:@"tai -.f" WaitUntilExit:YES]];

			[self showMe:@"fix" after:@"divFix" animate:NO];
			[self hideMe:@"top" animate:NO];
			[self hideMe:@"bottom" animate:NO];
		}
	}];
	[alert addAction:action];

	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}

-(void)results:(NSString *)results{
	NSString *leaf = @"\n\n                     .                          \n                     M                          \n                    dM                          \n                    MMr                         \n                   4MMML                  .     \n                   MMMMM.                xf     \n   .              \"MMMMM               .MM-     \n    Mh..          +MMMMMM            .MMMM      \n    .MMM.         .MMMMML.          MMMMMh      \n     )MMMh.        MMMMMM         MMMMMMM       \n      3MMMMx.     \'MMMMMMf      xnMMMMMM\"       \n      \'*MMMMM      MMMMMM.     nMMMMMMP\"        \n        *MMMMMx    \"MMMMM\\    .MMMMMMM=         \n         *MMMMMh   \"MMMMM\"   JMMMMMMP           \n           MMMMMM   3MMMM.  dMMMMMM            .\n            MMMMMM  \"MMMM  .MMMMM(        .nnMP\"\n=..          *MMMMx  MMM\"  dMMMM\"    .nnMMMMM*  \n  \"MMn...     \'MMMMr \'MM   MMM\"   .nMMMMMMM*\"   \n   \"4MMMMnn..   *MMM  MM  MMP\"  .dMMMMMMM\"\"     \n     ^MMMMMMMMx.  *ML \"M .M*  .MMMMMM**\"        \n        *PMMMMMMhn. *x > M  .MMMM**\"\"           \n           \"\"**MMMMhx/.h/ .=*\"                  \n                    .3P\"%....";

	NSArray *Remove = @[leaf, @"\x1B[30m", @"\x1B[31m", @"\x1B[32m", @"\x1B[33m", @"\x1B[34m", @"\x1B[35m", @"\x1B[36m", @"\x1B[37m", @"\x1B[0m", @"\x1B[1m", @"\x1B[3m", @"\x1B[7m", @"  ", @"\t", @"\n\n\n", @" Theos Auto Installer\n", @"Randy420\n", @"\n\n \n\n\n \n"];

	int h, i;
	for (h = 1; h != 2; h++){
		for (i = 0; i < [Remove count]; i++){
			results = [results stringByReplacingOccurrencesOfString:Remove[i] withString:@""];
		}
	}

	[UIPasteboard.generalPasteboard setValue:results forPasteboardType:(id)kUTTypeUTF8PlainText];

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