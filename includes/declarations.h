static BOOL deleteall = YES;
static BOOL rrfailure = NO;

int deleted = 0;
int total = 0;

NSString *path, *path1, *Title;

tai* CM;
NSFileManager* fileManager;

	NSString *successfulDelete = @"[Successfully Deleted From:]\n";
	NSString *failedDelete = @"[Failed To Delete From:]\n";
	NSString *myProgName = @"[Remove Russian Language\nby: Randy420]\n\n";
	NSString *rrmsg = @"";