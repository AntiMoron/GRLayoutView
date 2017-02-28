//
//  GRVerticalLayoutProtocol.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import <Foundation/Foundation.h>

#pragma mark - vertical layout

@protocol GRVerticalLayoutable <NSObject>
/**
 *  Height expected for current view
 *
 *  @return CGFloat
 */
-(CGFloat) GRLayoutLineHeight;
@optional
/**
 *  Margin left of current view
 *
 *  @return CGRect
 */
-(CGFloat) GRMarginLeft;
/**
 *  Margin right of current view
 *
 *  @return CGRect
 */
-(CGFloat) GRMarginRight;

@end
/**
 *  To get vertical layout content
 */
@protocol GRVerticalLayoutDatasource <NSObject>
/**
 *  GRVertical layout header view
 *
 *  @return UIView
 */
-(UIView<GRVerticalLayoutable>*) GRVerticalLayoutHeaderView;

@end

#pragma mark - horizontal layout

@protocol GRHorizontalLayoutable <NSObject>
/**
 *  Width expected for the view
 *
 *  @return CGFloat
 */
-(CGFloat) GRLayoutViewWidth;
@optional
/**
 *  Margin top of current view
 *
 *  @return CGRect
 */
-(CGFloat) GRMarginTop;
/**
 *  Margin bottom of current view
 *
 *  @return CGRect
 */
-(CGFloat) GRMarginBottom;

@end