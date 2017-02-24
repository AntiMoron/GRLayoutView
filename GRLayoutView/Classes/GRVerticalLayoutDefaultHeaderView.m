//
//  GRVerticalLayoutDefaultHeaderView.m
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import "GRVerticalLayoutDefaultHeaderView.h"

@interface GRVerticalLayoutDefaultHeaderView()
/**
 *  titleLabel
 */
@property(nonatomic, strong) UILabel* titleLabel;

@end

@implementation GRVerticalLayoutDefaultHeaderView

#pragma mark - initialization

-(void) GRVerticalLayoutDefaultHeaderViewCommonInit {
    self.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self GRVerticalLayoutDefaultHeaderViewCommonInit];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self GRVerticalLayoutDefaultHeaderViewCommonInit];
    return self;
}

/**
 *  Label for title
 */
-(UILabel*) titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.font = [UIFont systemFontOfSize:UIFont.smallSystemFontSize];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
/**
 *  Height expected
 */
-(CGFloat) GRLayoutLineHeight {
    if(!_titleLabel) {
        return [UIFont systemFontOfSize:UIFont.smallSystemFontSize].lineHeight + 10;
    }
    return _titleLabel.font.lineHeight + 10;
}


#pragma mark - layouting
/**
 *  layout method
 */
-(void) layoutSubviews {
    [super layoutSubviews];
    if(_titleLabel) {
        _titleLabel.frame = CGRectOffset(self.bounds, 10, 0);
    }
}

@end
