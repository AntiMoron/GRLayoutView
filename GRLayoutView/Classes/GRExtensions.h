//
//  GRExtensions.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#import <UIKit/UIKit.h>
#import "GRVerticalLayoutProtocol.h"


@interface UILabel(GRExtensions)<GRVerticalLayoutable>

-(CGFloat) GRLayoutLineHeight;

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
