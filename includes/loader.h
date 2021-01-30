void loader(){
	CM = [[tai alloc] init];
	fileManager = NSFileManager.defaultManager;

	deleteall = YES;
	failure = NO;

	deleted = 0;
	total = 0;

	successfulDelete = @"[Successfully Deleted]\n";
	failedDelete = @"[Failed To Delete]\n";
	rrmsg = @"";
}