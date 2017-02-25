//
//  GRExtensions.m
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import "GRExtensions.h"

@implementation UILabel(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.font.lineHeight + 20;
}

-(CGFloat) GRLayoutViewWidth {
    CGSize size = [self sizeThatFits:CGSizeMake(FLT_MAX, FLT_MAX)];
    return size.width;
}

@end


@implementation UIButton(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.titleLabel.font.lineHeight + 20;
}

@end


@implementation UITextView(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.font.lineHeight + 20;
}

@end


@implementation UITextField(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.font.lineHeight + 20;
}

@end


@implementation UIView(GRExtensions)

-(CGFloat) GRLayoutLineHeight {
    return self.bounds.size.height;
}

-(CGFloat) GRLayoutViewWidth {
    return self.bounds.size.width;
}

@end