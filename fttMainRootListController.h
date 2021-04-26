#import "helper.h"

@interface fttMainViewController : HBListController
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
@end

@interface fttControl : HBListController
@end

@interface fttMakefile : HBListController
@end