#include "taiDownloads.h"

@implementation taiDownloads
- (instancetype)init{
	myIcon = @"taihead";
	myTitle = @"Theos Auto Installer";
	self = [super init];
	return self;
}

- (NSArray *)specifiers {
	fm = [[NSFileManager alloc] init];
	self.plistName = @"taiDownloads";
	self.chosenIDs = @[@"all", @"eightFour", @"nineThree", @"ten", @"tenThree", @"eleven", @"elevenOne", @"elevenTwo", @"elevenThree", @"elevenFour", @"twelveOneTwo", @"twelveTwo", @"twelveFour", @"thirteen", @"thirteenTwo", @"thirteenFour", @"thirteenFive", @"fourteen", @"fourteenOne", @"fourteenTwo", @"fourteenThree", @"fourteenFour", @"fourteenFive"];
	return [super specifiers];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[super scrollViewDidScroll:scrollView];
}

-(void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier{
	[super setPreferenceValue:value specifier:specifier];

	NSString *key = [specifier propertyForKey:@"key"];

	if([key isEqualToString:@"sdks-master"]){
		if([value boolValue]){
			[self hideMe:@"eightFour" animate:YES];
			[self hideMe:@"nineThree" animate:YES];
			[self hideMe:@"ten" animate:YES];
			[self hideMe:@"tenThree" animate:YES];
			[self hideMe:@"eleven" animate:YES];
			[self hideMe:@"elevenOne" animate:YES];
			[self hideMe:@"elevenTwo" animate:YES];
			[self hideMe:@"elevenThree" animate:YES];
			[self hideMe:@"elevenFour" animate:YES];
			[self hideMe:@"twelveOneTwo" animate:YES ];
			[self hideMe:@"twelveTwo" animate:YES];
			[self hideMe:@"twelveFour" animate:YES];
			[self hideMe:@"thirteen" animate:YES];
			[self hideMe:@"thirteenTwo" animate:YES];
			[self hideMe:@"thirteenFour" animate:YES];
			[self hideMe:@"thirteenFive" animate:YES];
			[self hideMe:@"fourteen" animate:YES];
			[self hideMe:@"fourteenOne" animate:YES];
			[self hideMe:@"fourteenTwo" animate:YES];
			[self hideMe:@"fourteenThree" animate:YES];
			[self hideMe:@"fourteenFour" animate:YES];
			//[self hideMe:@"fourteenFive" animate:YES];
		} else{
			//[self showMe:@"fourteenFive" after:@"All" animate:YES];
			[self showMe:@"fourteenFour" after:@"All" animate:YES];
			[self showMe:@"fourteenThree" after:@"All" animate:YES];
			[self showMe:@"fourteenTwo" after:@"All" animate:YES];
			[self showMe:@"fourteenOne" after:@"All" animate:YES];
			[self showMe:@"fourteen" after:@"All" animate:YES];
			[self showMe:@"thirteenFive" after:@"All" animate:YES];
			[self showMe:@"thirteenFour" after:@"All" animate:YES];
			[self showMe:@"thirteenTwo" after:@"All" animate:YES];
			[self showMe:@"thirteen" after:@"All" animate:YES];
			[self showMe:@"twelveFour" after:@"All" animate:YES];
			[self showMe:@"twelveTwo" after:@"All" animate:YES];
			[self showMe:@"twelveOneTwo" after:@"All" animate:YES];
			[self showMe:@"elevenFour" after:@"All" animate:YES];
			[self showMe:@"elevenThree" after:@"All" animate:YES];
			[self showMe:@"elevenTwo" after:@"All" animate:YES];
			[self showMe:@"elevenOne" after:@"All" animate:YES];
			[self showMe:@"eleven" after:@"All" animate:YES];
			[self showMe:@"tenThree" after:@"All" animate:YES];
			[self showMe:@"ten" after:@"All" animate:YES];
			[self showMe:@"nineThree" after:@"All" animate:YES];
			[self showMe:@"eightFour" after:@"All" animate:YES];
		}
	}
}

-(void)reloadSpecifiers{
	[super reloadSpecifiers];

	if(GetBool(@"sdks-master", NO, @"com.randy420.tai")){
		[self hideMe:@"eightFour" animate:YES];
		[self hideMe:@"nineThree" animate:YES];
		[self hideMe:@"ten" animate:YES];
		[self hideMe:@"tenThree" animate:YES];
		[self hideMe:@"eleven" animate:YES];
		[self hideMe:@"elevenOne" animate:YES];
		[self hideMe:@"elevenTwo" animate:YES];
		[self hideMe:@"elevenThree" animate:YES];
		[self hideMe:@"elevenFour" animate:YES];
		[self hideMe:@"twelveOneTwo" animate:YES ];
		[self hideMe:@"twelveTwo" animate:YES];
		[self hideMe:@"twelveFour" animate:YES];
		[self hideMe:@"thirteen" animate:YES];
		[self hideMe:@"thirteenTwo" animate:YES];
		[self hideMe:@"thirteenFour" animate:YES];
		[self hideMe:@"thirteenFive" animate:YES];
		[self hideMe:@"fourteen" animate:YES];
		[self hideMe:@"fourteenOne" animate:YES];
		[self hideMe:@"fourteenTwo" animate:YES];
		[self hideMe:@"fourteenThree" animate:YES];
		[self hideMe:@"fourteenFour" animate:YES];
		//[self hideMe:@"fourteenFive" animate:YES];
	}
}

-(void)viewDidLoad{
	[super viewDidLoad];
	[self reloadSpecifiers];

	CGFloat height = [UIScreen mainScreen].bounds.size.height;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,width,0.50 * width)];
	self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,width,0.30 * width)];
	self.credit = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,height)];
	self.credit.text = @"";
	self.headerImageView.contentMode = UIViewContentModeScaleToFill;
	self.headerImageView.image = [UIImage imageNamed:myIcon inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
	self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.headerView addSubview:self.headerImageView];

	[NSLayoutConstraint activateConstraints:@[
		[self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
		[self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
		[self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
		[self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
	]];
	_table.tableHeaderView = self.headerView;
}

-(id)readPreferenceValue:(PSSpecifier *)specifier{
	return [super readPreferenceValue:specifier];
}
@end