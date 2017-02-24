//
//  GRVerticalLayoutView.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import <UIKit/UIKit.h>
#import "GRVerticalLayoutProtocol.h"

@interface GRVerticalLayoutView : UIScrollView<GRVerticalLayoutable>
/**
 *  int with managed views
 *
 *  @param headerContent Content that displayed in header view
 *  @param views         managed views
 *
 *  @return instance
 */
-(instancetype) initWithHeaderContent:(NSString*) string withViews:(NSArray<UIView<GRVerticalLayoutable>*>*) views NS_DESIGNATED_INITIALIZER;
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
 *  datasource
 */
@property(nonatomic, weak) id<GRVerticalLayoutDatasource> datasource;
/**
 *  Size of gap between header and the first managed view.
 */
@property(nonatomic, assign) CGFloat headerGapSize;
/**
 *  Size of gaps between views
 */
@property(nonatomic, assign) CGFloat averageGapSize;
/**
 *  Content for header
 *  If this value isn't set, there will be no header.
 *  Otherwise header would be added automatically.
 *  at the meantime showHeader set to `YES`
 */
@property(nonatomic, copy) NSString* headerContent;
/**
 *  Whether to show header.
 */
@property(nonatomic, assign) BOOL showHeader;
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
 *  Height expected
 *
 *  @return CGFloat
 */
-(CGFloat) GRLayoutLineHeight;

@end
