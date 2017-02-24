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
