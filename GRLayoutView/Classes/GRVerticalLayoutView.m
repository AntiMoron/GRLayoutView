//
//  GRVerticalLayoutView.m
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import "GRExtensions.h"
#import "GRVerticalLayoutView.h"
#import "GRVerticalLayoutDefaultHeaderView.h"

@interface GRVerticalLayoutView()
/**
 *  Cache for header.
 */
@property(nonatomic, strong) UIView<GRVerticalLayoutable>* cachedHeaderView;

@end

@implementation GRVerticalLayoutView

#pragma mark - initializations

/**
 *  Create an instance
 *
 *  @param views         managed views
 *  @param headerContent Content that displayed in header view
 *
 *  @return instance
 */
-(instancetype) initWithHeaderContent:(NSString*) headerContent withViews:(NSArray<UIView<GRVerticalLayoutable>*>*) views {
    self = [self initWithFrame:CGRectZero];
    self.views = views;
    self.headerContent = headerContent;
    return self;
}

-(void) GRVerticalLayoutViewCommonInit {
    self.averageGapSize = 10;
    self.headerGapSize = 5;
    self.bounces = YES;
    self.alwaysBounceVertical = YES;
    self.alwaysBounceHorizontal = NO;
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

-(void) setHeaderContent:(NSString *)headerContent {
    if(headerContent != nil) {
        self.showHeader = YES;
    }
    if([self.cachedHeaderView isKindOfClass:GRVerticalLayoutDefaultHeaderView.class]) {
        GRVerticalLayoutDefaultHeaderView* defaultHeader = (GRVerticalLayoutDefaultHeaderView*)self.cachedHeaderView;
        defaultHeader.titleLabel.text = headerContent;
    }
}
/**
 *  layoutMethod
 */
-(void) layoutSubviews {
    [super layoutSubviews];
    CGFloat yPos = 0;
    if(self.showHeader) {
        if(!self.cachedHeaderView) {
            self.cachedHeaderView = [self fetchHeaderView];
            [self addSubview:self.cachedHeaderView];
        }
        self.cachedHeaderView.frame = CGRectMake(0, 0, self.bounds.size.width,
                                                 self.cachedHeaderView.GRLayoutLineHeight);
        yPos = CGRectGetMaxY(self.cachedHeaderView.frame);
        if(self.views.count > 0) {
            yPos += self.headerGapSize;
        }
    }
    for(UIView<GRVerticalLayoutable>* layerView in self.views) {
        [self addSubview:layerView];
        layerView.frame = CGRectMake(0, yPos, self.bounds.size.width, layerView.GRLayoutLineHeight);
        yPos = CGRectGetMaxY(layerView.frame);
        yPos += self.averageGapSize;
    }
    if(self.views.count > 0) {
        yPos -= self.averageGapSize;
    }
    self.contentSize = CGSizeMake(self.bounds.size.width, yPos);
}

#pragma mark - overload setters

-(void) setShowHeader:(BOOL)showHeader {
    _showHeader = showHeader;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

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

-(CGFloat) GRLayoutLineHeight {
    CGFloat yPos = 0;
    if(self.showHeader) {
        if(!self.cachedHeaderView) {
            self.cachedHeaderView = [self fetchHeaderView];
            [self addSubview:self.cachedHeaderView];
        }
        yPos += self.cachedHeaderView.GRLayoutLineHeight;
        if(self.views.count > 0) {
            yPos += self.headerGapSize;
        }
    }

    for(UIView<GRVerticalLayoutable>* layerView in self.views) {
        [self addSubview:layerView];
        yPos += layerView.GRLayoutLineHeight;
        yPos += self.averageGapSize;
    }
    if(self.views.count > 0) {
        yPos -= self.averageGapSize;
    }
    return yPos;
}


-(UIView<GRVerticalLayoutable>*) fetchHeaderView {
    if(self.datasource && [self.datasource respondsToSelector:@selector(GRVerticalLayoutHeaderView)]) {
        return [self.datasource GRVerticalLayoutHeaderView];
    }
    return [[GRVerticalLayoutDefaultHeaderView alloc] init];
}

@end
