#include <Preferences/PSListController.h>
#include <Preferences/PSSpecifier.h>
#include <spawn.h>
#include <Social/SLComposeViewController.h>
#include <Social/SLServiceTypes.h>
#include <Twitter/Twitter.h>
#include <objc/runtime.h>
#include <Preferences/PSTableCell.h>
#include <Social/SLComposeViewController.h>
#include <Social/SLServiceTypes.h>
#include <Twitter/Twitter.h>
#include <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#include <stdio.h>
#include <dirent.h>

#include "functions/420.h"


@interface PSListController (iOS12Plus)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
@end

@interface AppearanceSettings : HBAppearanceSettings
@end

@interface tools420RootListController : HBListController{
    UITableView * _table;
}
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *credit;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, assign) BOOL Tai;
@property (nonatomic, assign) BOOL Vs;
@property (nonatomic, assign) BOOL rr;
@property (nonatomic, assign) BOOL Ftt;
@property (nonatomic, assign) BOOL Up2Date;
@property(nonatomic, assign) NSInteger totalz;
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
-(void) showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate;
-(void) hideMe:(NSString *)hideMe animate:(bool)animate;

@end

@interface rrRootListController : HBListController

@end

@interface fttMainViewController : HBListController {
    UITableView * _table;
}
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *credit;
@property (nonatomic, retain) UIImageView *iconView;
@end

@interface vspRootListController : HBListController {
    UITableView * _table;
}
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *credit;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, assign) BOOL separate;
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
-(void) showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate;
-(void) hideMe:(NSString *)hideMe animate:(bool)animate;
@end

@interface taiprRootListController : HBListController {
    UITableView * _table;
}
@property (nonatomic, assign) BOOL dlAll;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *credit;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;
-(void) showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate;
-(void) hideMe:(NSString *)hideMe animate:(bool)animate;
@end

@interface fttControl : PSListController
@end

@interface fttMakefile : PSListController
@end