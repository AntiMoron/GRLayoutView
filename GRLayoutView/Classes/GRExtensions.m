//
//  GRExtensions.m
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import "GRExtensions.h"
#import <objc/runtime.h>

@implementation UILabel(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.font.lineHeight + 20;
}

-(CGFloat) GRLayoutViewWidth {
    CGSize size = [self sizeThatFits:CGSizeMake(FLT_MAX, FLT_MAX)];
    return size.width + 20;
}

@end


@implementation UIButton(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.titleLabel.font.lineHeight + 20;
}

-(CGFloat) GRLayoutViewWidth {
    return [self.titleLabel sizeThatFits:CGSizeZero].width + 20;
}

@end


@implementation UITextView(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.font.lineHeight + 20;
}

-(CGFloat) GRLayoutLineWidth {
    return UIScreen.mainScreen.bounds.size.width * 0.5;
}

@end


@implementation UITextField(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.font.lineHeight + 20;
}

-(CGFloat) GRLayoutLineWidth {
    return UIScreen.mainScreen.bounds.size.width * 0.5;
}

@end


@implementation UIView(GRExtensions)

/**
 *  To create an instance
 *
 *  @param frame  size
 *  @param margin margin - top, right, bottom, left
 *
 *  @return instance
 */
-(instancetype) initWithLayoutFrame:(CGRect)frame withMargins:(CGRect) margin {
    self = [self initWithFrame:frame];
    self.GRMarginTop = margin.origin.x;
    self.GRMarginRight = margin.origin.y;
    self.GRMarginBottom = margin.size.width;
    self.GRMarginLeft = margin.size.height;
    return self;
}

-(void) setGRMarginTop:(CGFloat)GRMarginTop {
    objc_setAssociatedObject(self, @"GRMarginTop", @(GRMarginTop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setGRMarginLeft:(CGFloat)GRMarginLeft {
    objc_setAssociatedObject(self, @"GRMarginLeft", @(GRMarginLeft), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setGRMarginRight:(CGFloat)GRMarginRight {
    objc_setAssociatedObject(self, @"GRMarginRight", @(GRMarginRight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setGRMarginBottom:(CGFloat)GRMarginBottom {
    objc_setAssociatedObject(self, @"GRMarginBottom", @(GRMarginBottom), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setGRLayoutMutableViewWidth:(CGFloat)GRLayoutViewWidth {
    objc_setAssociatedObject(self, @"setGRLayoutMutableViewWidth", @(GRLayoutViewWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) setGRLayoutMutableLineHeight:(CGFloat)GRLayoutLineHeight {
    objc_setAssociatedObject(self, @"setGRLayoutMutableLineHeight", @(GRLayoutLineHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat) GRMarginLeft {
    return [(NSNumber *)objc_getAssociatedObject(self, @"GRMarginLeft") doubleValue];
}

-(CGFloat) GRMarginTop {
    return [(NSNumber *)objc_getAssociatedObject(self, @"GRMarginTop") doubleValue];
}

-(CGFloat) GRMarginRight {
    return [(NSNumber *)objc_getAssociatedObject(self, @"GRMarginRight") doubleValue];
}

-(CGFloat) GRMarginBottom {
    return [(NSNumber *)objc_getAssociatedObject(self, @"GRMarginBottom") doubleValue];
}

-(CGFloat) GRLayoutLineHeight {
    if(self.GRLayoutMutableLineHeight > 0) {
        return self.GRLayoutMutableLineHeight;
    }
    return self.bounds.size.height;
}

-(CGFloat) GRLayoutViewWidth {
    if(self.GRLayoutMutableViewWidth > 0) {
        return self.GRLayoutMutableViewWidth;
    }
    return self.bounds.size.width;
}

-(CGFloat) GRLayoutMutableLineHeight {
    return [(NSNumber *)objc_getAssociatedObject(self, @"setGRLayoutMutableLineHeight") doubleValue];
}

-(CGFloat) GRLayoutMutableViewWidth {
    return [(NSNumber *)objc_getAssociatedObject(self, @"setGRLayoutMutableViewWidth") doubleValue];
}

@end