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
-(instancetype) initWithViews:(NSArray<UIView<GRHorizontalLayoutable>*>*) views {
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
    for(UIView<GRVerticalLayoutable, GRHorizontalLayoutable>* layerView in self.views) {
        CGFloat leftMargin = 0, rightMargin = 0, topMargin = 0, bottomMargin = 0;
        if([layerView respondsToSelector:@selector(GRMarginLeft)]) {
            leftMargin = layerView.GRMarginLeft;
        }
        if([layerView respondsToSelector:@selector(GRMarginRight)]) {
            rightMargin = layerView.GRMarginRight;
        }
        if([layerView respondsToSelector:@selector(GRMarginTop)]) {
            topMargin = layerView.GRMarginTop;
        }
        if([layerView respondsToSelector:@selector(GRMarginBottom)]) {
            bottomMargin = layerView.GRMarginBottom;
        }
        xPos += leftMargin;
        layerView.frame = CGRectMake(xPos, topMargin, layerView.GRLayoutViewWidth, self.bounds.size.height - topMargin - bottomMargin);
        xPos = CGRectGetMaxX(layerView.frame);
        xPos += rightMargin;
        xPos += self.averageGapSize;
    }
    if(self.views.count > 0) {
        xPos -= self.averageGapSize;
    }
    self.contentSize = CGSizeMake(xPos, self.bounds.size.height);
}

#pragma mark - overload setters

-(void) setViews:(NSArray<UIView<GRHorizontalLayoutable>*> *)views {
    for(UIView* aSubview in _views) {
        [aSubview removeFromSuperview];
    }
    NSMutableArray* viewSafetyCheck = views.mutableCopy;
    NSMutableArray* safeViews = @[].mutableCopy;
    for(UIView* aSubview in viewSafetyCheck) {
        if(aSubview == self) {
            continue;
        }
        if(![aSubview conformsToProtocol:@protocol(GRHorizontalLayoutable)]) {
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
    CGFloat xPos = 0;
    for(UIView<GRVerticalLayoutable, GRHorizontalLayoutable>* layerView in self.views) {
        CGFloat leftMargin = 0, rightMargin = 0, topMargin = 0, bottomMargin = 0;
        if([layerView respondsToSelector:@selector(GRMarginLeft)]) {
            leftMargin = layerView.GRMarginLeft;
        }
        if([layerView respondsToSelector:@selector(GRMarginRight)]) {
            rightMargin = layerView.GRMarginRight;
        }
        if([layerView respondsToSelector:@selector(GRMarginTop)]) {
            topMargin = layerView.GRMarginTop;
        }
        if([layerView respondsToSelector:@selector(GRMarginBottom)]) {
            bottomMargin = layerView.GRMarginBottom;
        }
        xPos += leftMargin;
        xPos += layerView.GRLayoutViewWidth;
        xPos += rightMargin;
        xPos += self.averageGapSize;
    }
    if(self.views.count > 0) {
        xPos -= self.averageGapSize;
    }
    return xPos;
}

@end
