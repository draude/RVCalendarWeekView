#import "MSDayColumnHeader.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "UIColor+HexString.h"

@interface MSDayColumnHeader ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIView *titleBackground;

@end

@implementation MSDayColumnHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleBackground                    = [UIView new];
        self.titleBackground.layer.cornerRadius = nearbyintf(15.0);
        [self addSubview:self.titleBackground];
        
        self.backgroundColor        = [UIColor clearColor];
        self.title                  = [UILabel new];
        self.title.backgroundColor  = [UIColor clearColor];
        [self addSubview:self.title];
        
        [self.titleBackground mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(8.0, 4.0, 8.0, 4.0));
        }];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.titleBackground).with.insets(UIEdgeInsetsMake(4.0, 4.0, 4.0, 4.0));
        }];
    }
    return self;
}

- (void)setDay:(NSDate *)day
{
    _day = day;
    NSString *dayText = [self.dateFormatter stringFromDate:day];
    self.title.text = dayText;
    self.title.adjustsFontSizeToFitWidth = YES;
    [self setNeedsLayout];
}

- (void)setCurrentDay:(BOOL)currentDay
{
    _currentDay = currentDay;
    
    if (currentDay) {
        self.title.textColor                    = [UIColor whiteColor];
        self.title.font                         = [UIFont boldSystemFontOfSize:16.0];
        self.titleBackground.backgroundColor    = [UIColor colorWithHexString:@"fd3935"];
    } else {
        self.title.font                         = [UIFont systemFontOfSize:16.0];
        self.title.textColor                    = [UIColor blackColor];
        self.titleBackground.backgroundColor    = [UIColor clearColor];
    }
}

@end
