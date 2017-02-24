//
//  GRHorizontalLayoutView.m
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import "GRHorizontalLayoutView.h"

@implementation GRHorizontalLayoutView

/**
 *  Create an instance
 *
 *  @param views         managed views
 *  @param headerContent Content that displayed in header view
 *
 *  @return instance
 */
-(instancetype) initWithViews:(NSArray<UIView<GRVerticalLayoutable>*>*) views {
    self = [self initWithFrame:CGRectZero];
    self.views = views;
    return self;
}

-(void) GRVerticalLayoutViewCommonInit {
    self.averageGapSize = 10;
    self.bounces = YES;
    self.alwaysBounceVertical = NO;
    self.alwaysBounceHorizontal = YES;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self GRVerticalLayoutViewCommonInit];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self GRVerticalLayoutViewCommonInit];
    return self;
}

#pragma mark - 重载setter
/**
 *  To reset gap size
 *
 *  @param averageGapSize size of gaps
 */
-(void) setAverageGapSize:(CGFloat)averageGapSize {
    _averageGapSize = averageGapSize;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - Layouting
/**
 *  layoutMethod
 */
-(void) layoutSubviews {
    [super layoutSubviews];
    CGFloat xPos = 0;
    for(UIView<GRHorizontalLayoutable>* layerView in self.views) {
        [self addSubview:layerView];
        layerView.frame = CGRectMake(xPos, 0, layerView.GRLayoutViewWidth, self.bounds.size.height);
        xPos = CGRectGetMaxX(layerView.frame);
        xPos += self.averageGapSize;
    }
    if(self.views.count > 0) {
        xPos -= self.averageGapSize;
    }
    self.contentSize = CGSizeMake(xPos, self.bounds.size.height);
}

#pragma mark - overload setters

-(void) setViews:(NSArray<UIView<GRVerticalLayoutable>*> *)views {
    for(UIView* aSubview in _views) {
        [aSubview removeFromSuperview];
    }
    NSMutableArray* viewSafetyCheck = views.mutableCopy;
    NSMutableArray* safeViews = @[].mutableCopy;
    for(UIView* aSubview in viewSafetyCheck) {
        if(aSubview == self) {
            continue;
        }
        if(![aSubview conformsToProtocol:@protocol(GRVerticalLayoutable)]) {
            continue;
        }
        if(aSubview.superview) {
            continue;
        }
        [safeViews addObject:aSubview];
    }
    _views = safeViews;
    for(UIView* aSubview in _views) {
        [self addSubview:aSubview];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


-(CGFloat) GRLayoutViewWidth {
    return 100;
}

@end
