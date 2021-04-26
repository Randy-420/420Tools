#import "helper.h"

@interface tools420RootListController : HBListController
{
	cmd *Run;
	PoP *popUp;
	NSString *altPics;
	NSString *origPics;
	NSString *originalPics;
	NSString *myIcon;
	NSString *myTitle;
	UITableView *_table;
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