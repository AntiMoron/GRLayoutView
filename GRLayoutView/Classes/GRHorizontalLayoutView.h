//
//  GRHorizontalLayoutView.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import <UIKit/UIKit.h>
#import "GRVerticalLayoutProtocol.h"

@interface GRHorizontalLayoutView : UIScrollView<GRHorizontalLayoutable>
/**
 *  Create an instance
 *
 *  @param views         managed views
 *
 *  @return instance
 */
-(instancetype) initWithViews:(NSArray<UIView<GRVerticalLayoutable>*>*) views NS_DESIGNATED_INITIALIZER;
/**
 *  initWithCoder
 *
 *  @param aDecoder decoder
 *
 *  @return instance
 */
-(instancetype) initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
/**
 *  init with frame
 *
 *  @param frame CGRect
 *
 *  @return instance
 */
-(instancetype) initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;
/**
 *  Size of gaps between views
 */
@property(nonatomic, assign) CGFloat averageGapSize;
/**
 *  list of views that this view will manage
 *  !!! `Views` cannot contain:
 *  - `self`,
 *  - `views with super view`,
 *  - `views that doesn't conform protocol 'GRVerticalLayoutable'`
 *  If these views exist, they will be excluded.
 */
@property(nonatomic, copy) NSArray<UIView<GRVerticalLayoutable>*>* views;
/**
 *  Width expected for the view
 *
 *  @return CGFloat
 */
-(CGFloat) GRLayoutViewWidth;

@end
