//
//  GRLayoutView.h
//  Pods
//
//  Created by GaoBoyuan on 17/2/24.
//
//

#ifndef GRLayoutView_h
#define GRLayoutView_h

#import "GRExtensions.h"
#import "GRVerticalLayoutView.h"
#import "GRHorizontalLayoutView.h"

#pragma mark - macro

#define _GRCreateArray(...)  [NSArray arrayWithObjects:__VA_ARGS__, nil]
#define _GRVertical(H, ...)  [[GRVerticalLayoutView alloc] initWithHeaderContent:(H) withViews:_GRCreateArray(__VA_ARGS__)]
/**
 *  Create a GRVerticalLayoutView
 *  To create a layoutview with header check `GRVerticalH`
 *
 *  @param Views views that this view manages
 *
 *  @return GRVerticalLayoutView
 */
#define GRVertical(...)  _GRVertical(nil, __VA_ARGS__)
/**
 *  Create a GRVerticalLayoutView
 *
 *  @param H     header content
 *  @param Views views that this view manages
 *
 *  @return GRVerticalLayoutView
 */
#define GRVerticalH(H, ...)  _GRVertical(H, __VA_ARGS__)
/**
 *  Create a GRHorizontalLayoutView
 *
 *  @param Views views that this view manages
 *
 *  @return GRHorizontalLayoutView
 */
#define _GRHorizontal(...) [[GRHorizontalLayoutView alloc] initWithViews:_GRCreateArray(__VA_ARGS__)]
/**
 *  Create a GRHorizontalLayoutView
 *
 *  @param Views views that this view manages
 *
 *  @return GRHorizontalLayoutView
 */
#define GRHorizontal(...) _GRHorizontal(__VA_ARGS__)

#endif /* GRLayoutView_h */
