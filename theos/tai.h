@interface tai : NSObject{
	/* VARIABLES */
	NSString *runCode;
	NSString *tFolderSuc;
	NSString *tFolderFail;
	NSString *tFolderIgnore;
	NSString *previousInstallMsg;
	NSString *theosSuccessMessage;
	NSString *theosFailureMessage;
	NSString *successfulSdk;
	NSString *failedSdk;
	NSString *ignored;
	NSString *enhanceMsg;
	NSString *updated;
	NSString *Loc;
	NSString *msg;
	NSString *dlLinK;
	NSString *installHere;
	NSString *checkInstall;
}
/* ENHANCEMENTS */
@property (nonatomic, assign) BOOL enhance;
/* SDKS */
@property (nonatomic, assign) BOOL all;
@property (nonatomic, assign) BOOL eightFour;
@property (nonatomic, assign) BOOL nineThree;
@property (nonatomic, assign) BOOL ten;
@property (nonatomic, assign) BOOL tenThree;
@property (nonatomic, assign) BOOL eleven;
@property (nonatomic, assign) BOOL elevenOne;
@property (nonatomic, assign) BOOL elevenTwo;
@property (nonatomic, assign) BOOL elevenThree;
@property (nonatomic, assign) BOOL elevenFour;
@property (nonatomic, assign) BOOL twelveOneTwo;
@property (nonatomic, assign) BOOL twelveTwo;
@property (nonatomic, assign) BOOL twelveFour;
@property (nonatomic, assign) BOOL thirteen;
@property (nonatomic, assign) BOOL thirteenTwo;
@property (nonatomic, assign) BOOL thirteenFour;
@property (nonatomic, assign) BOOL thirteenFive;
@property (nonatomic, assign) BOOL fourteen;
@property (nonatomic, assign) BOOL fourteenOne;
@property (nonatomic, assign) BOOL fourteenTwo;
@property (nonatomic, assign) BOOL fourteenThree;
@property (nonatomic, assign) BOOL fourteenFour;
@property (nonatomic, assign) BOOL fourteenFive;
/* CHECKS */
@property (nonatomic, assign) BOOL failure;
@property (nonatomic, assign) BOOL alreadyHas;
@property (nonatomic, assign) BOOL enhanced;
@property (nonatomic, assign) BOOL installSuccess;
@property (nonatomic, assign) BOOL previousInstall;
@property (nonatomic, assign) BOOL tweaksMade;
@property (nonatomic, assign) BOOL tweaksExists;
@property (nonatomic, assign) BOOL folderFailed;
@property (nonatomic, assign) BOOL theosUpdate;
@property (nonatomic, assign) BOOL attempted;
@property (nonatomic, assign) BOOL failed;
@property (nonatomic, assign) BOOL PoPuP;
@property (nonatomic, assign) BOOL useColor;
@property (nonatomic, assign) BOOL installedTheos;
@property (nonatomic, assign) BOOL installedVarTheos;
@property (nonatomic, assign) BOOL toolsInstalled;
/* COUNTER */
@property (nonatomic, assign) int totalDownloaded;

-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit;
-(void)makeTweaksFolder;
-(BOOL)theosInstall;
-(void)loader;
-(void)sdk:(NSString*)sdk Link:(NSString*)Link;
-(void)DoWnLoAd;
-(void)upDateTheos;
-(void)enhancer;
-(void)addMsg:(NSString *)mSg;
-(void)popup;
@end