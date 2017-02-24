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

@end