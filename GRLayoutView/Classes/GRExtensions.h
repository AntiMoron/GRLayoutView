//
//  GRExtensions.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import <UIKit/UIKit.h>
#import "GRVerticalLayoutProtocol.h"


@interface UILabel(GRExtensions)<GRVerticalLayoutable, GRHorizontalLayoutable>
/**
 *  The height that a label needs.
 *
 *  @return CGFloat
 */
-(CGFloat) GRLayoutLineHeight;
/**
 *  The width that a label needs when 
 *  texts are rendered in one single line.
 *
 *  @return CGFloat
 */
-(CGFloat) GRLayoutViewWidth;

@end


@interface UIButton(GRExtensions)<GRVerticalLayoutable>

-(CGFloat) GRLayoutLineHeight;

@end


@interface UITextView(GRExtensions)<GRVerticalLayoutable>

-(CGFloat) GRLayoutLineHeight;

@end

@interface UITextField(GRExtensions)<GRVerticalLayoutable>

-(CGFloat) GRLayoutLineHeight;

@end


@interface UIView(GRExtensions)<GRVerticalLayoutable, GRHorizontalLayoutable>
/**
 *  To create an instance
 *
 *  @param frame  size
 *  @param margin margin - top, right, bottom, left
 *
 *  @return instance
 */
-(instancetype) initWithLayoutFrame:(CGRect)frame withMargins:(CGRect)margin;

-(CGFloat) GRLayoutLineHeight;

-(CGFloat) GRLayoutViewWidth;

@property(nonatomic, assign) CGFloat GRMarginRight;

@property(nonatomic, assign) CGFloat GRMarginLeft;

@property(nonatomic, assign) CGFloat GRMarginTop;

@property(nonatomic, assign) CGFloat GRMarginBottom;

@end