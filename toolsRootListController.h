#import "functions/Randy420.h" 

#define buttonCellWithName(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:NULL get:NULL detail:NULL cell:PSButtonCell edit:Nil]
#define groupSpec(name) [PSSpecifier groupSpecifierWithName:name]

#define sliderCellWithName(name) [PSSpecifier preferenceSpecifierNamed: name target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:NULL cell:PSSliderCell edit:Nil]
#define subtitleSwitchCellWithName(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:NULL cell:PSSwitchCell edit:Nil]
#define switchCellWithName(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:NULL cell:PSSwitchCell edit:Nil]
#define textCellWithName(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:NULL get:NULL detail:NULL cell:PSStaticTextCell edit:Nil]
#define linkCellWithName(name, controller) [PSSpecifier preferenceSpecifierNamed:name target:self set:NULL get:NULL detail:NSClassFromString(controller) cell:PSLinkCell edit:Nil]
#define buttonCell(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:nil get:nil detail:nil cell:PSButtonCell edit:nil];

#define setClass(className) [specifier setProperty:className forKey:@"cellClass"]
#define setAction(action) [specifier setProperty:action forKey:@"action"]
#define setDefaultForSpec(sDefault) [specifier setProperty:sDefault forKey:@"default"]
#define setKey(key) [specifier setProperty:key forKey:@"key"]
#define setId(id) [specifier setProperty:id forKey:@"id"]
#define setImg(img) [specifier setProperty:imageNamed(img) forKey:@"iconImage"];
#define setFooterForSpec(footer) [specifier setProperty:footer forKey:@"footerText"]
#define setMinForSpec(minimum) [specifier setProperty:minimum forKey:@"min"]
#define setMaxForSpec(maximum) [specifier setProperty:maximum forKey:@"max"]
#define setShowsValue(shows) [specifier setProperty:shows forKey:@"showValue"]
#define addSpec [mutableSpecifiers addObject:specifier]

#define BundlePath @"/Library/PreferenceBundles/tools420.bundle"


static UIImage *imageNamed(NSString *name) {
    return [UIImage imageNamed:name inBundle:[NSBundle bundleWithPath:BundlePath] compatibleWithTraitCollection:nil];
	}

@interface tools420RootListController : randy420
{
	NSString *altPics;
	NSString *origPics;
	NSString *originalPics;
}
@property (nonatomic, assign) BOOL Tai;
@property (nonatomic, assign) BOOL Vs;
@property (nonatomic, assign) BOOL rr;
@property (nonatomic, assign) BOOL Ftt;
@property (nonatomic, assign) BOOL Up2Date;
@property(nonatomic, assign) NSInteger totalz;
@end