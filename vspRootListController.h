#import "helper.h"

@interface vspRootListController : HBListController
{
	NSString *myIcon;
	NSString *myTitle;
	UITableView *_table;
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