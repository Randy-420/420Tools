#import "helper.h"

@interface taiprRootListController : HBListController
{
	tai *TAI;
	NSString *myIcon;
	NSString *myTitle;
	UITableView *_table;
}
@property (nonatomic, assign) BOOL dlAll;
@property (nonatomic, assign) BOOL installed;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *credit;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;

-(void)update;
-(void)showMe:(NSString *)showMe after:(NSString *)after animate:(bool)animate;
-(void)hideMe:(NSString *)hideMe animate:(bool)animate;
@end