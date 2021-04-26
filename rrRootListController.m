#include "rrRootListController.h"

@implementation rrRootListController
- (NSArray *)specifiers{
	if (!_specifiers){
		_specifiers = [self loadSpecifiersFromPlistName:@"rr" target:self];
	}
	return _specifiers;
}

-(void)deleteRussianLanguage{
	cmd *rr = [[cmd alloc] init];
	NSString *rrmsg = [rr RunCMD:CC(@"rr -~") WaitUntilExit:YES];

	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"[Remove Russian Language\nby: Randy420]\n\n" message: rrmsg preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
	}];
	[alert addAction:action];
	[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
}
@end