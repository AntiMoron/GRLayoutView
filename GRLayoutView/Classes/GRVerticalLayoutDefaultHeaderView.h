//
//  GRVerticalLayoutDefaultHeaderView.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import <UIKit/UIKit.h>
#import "GRVerticalLayoutProtocol.h"
/**
 *  Default header for GRVerticalLayoutView
 */
@interface GRVerticalLayoutDefaultHeaderView : UIView<GRVerticalLayoutable>
/**
 *  Label for title
 */
-(UILabel*) titleLabel;
/**
 *  Height expected
 */
-(CGFloat) GRLayoutLineHeight;

@end
