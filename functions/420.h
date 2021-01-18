#import <Foundation/Foundation.h>
#include <spawn.h>
#include "includes.h"

@interface UIDevice ()
- (id)_deviceInfoForKey:(NSString *)key;  
@end

@interface tai : NSObject
-(void) RunCMD:(NSString *)RunCMD;
-(void) RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit;
-(NSString *) RunRoot:(NSString *)RunRoot;
-(void) RunRoot:(NSString *)RunRoot WaitUntilExit:(BOOL)WaitUntilExit;
-(void)makeTweaksFolder;
-(BOOL)theosInstall;
-(void)loader;
-(bool)sdk:(NSString*)sdk Link:(NSString*)Link;
-(void)DoWnLoAd;
-(void)upDateTheos;
-(void)enhancer;
-(int)Decrypt:(NSString *)uKey;
-(BOOL)udidCheck:(NSString *)crypt0 prefPLIsT:(NSString *)prefPLIsT path:(NSString *)path;
-(void)addMsg:(NSString *)mSg;
-(void)popup;
@end

// NSTask.h
#import <Foundation/NSObject.h>

@class NSString, NSArray, NSDictionary;

@interface NSTask : NSObject

// Create an NSTask which can be run at a later time
// An NSTask can only be run once. Subsequent attempts to
// run an NSTask will raise.
// Upon task death a notification will be sent
//   { Name = NSTaskDidTerminateNotification; object = task; }
//

- (instancetype)init;

// set parameters
// these methods can only be done before a launch
- (void)setLaunchPath:(NSString *)path;
- (void)setArguments:(NSArray *)arguments;
- (void)setEnvironment:(NSDictionary *)dict;
// if not set, use current
- (void)setCurrentDirectoryPath:(NSString *)path;
// if not set, use current

// set standard I/O channels; may be either an NSFileHandle or an NSPipe
- (void)setStandardInput:(id)input;
- (void)setStandardOutput:(id)output;
- (void)setStandardError:(id)error;

// get parameters
- (NSString *)launchPath;
- (NSArray *)arguments;
- (NSDictionary *)environment;
- (NSString *)currentDirectoryPath;

// get standard I/O channels; could be either an NSFileHandle or an NSPipe
- (id)standardInput;
- (id)standardOutput;
- (id)standardError;

// actions
- (void)launch;

- (void)interrupt; // Not always possible. Sends SIGINT.
- (void)terminate; // Not always possible. Sends SIGTERM.

- (BOOL)suspend;
- (BOOL)resume;

// status
- (int)processIdentifier;
- (BOOL)isRunning;

- (int)terminationStatus;

@end

@interface NSTask (NSTaskConveniences)

+ (NSTask *)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments;
// convenience; create and launch

- (void)waitUntilExit;
// poll the runLoop in defaultMode until task completes

@end

FOUNDATION_EXPORT NSString * const NSTaskDidTerminateNotification;