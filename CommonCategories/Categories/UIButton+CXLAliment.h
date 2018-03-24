//
//  UIButton+CXLAliment.h
//  CommonCategories
//
//  Created by bjovov on 2018/3/23.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CXLAliment)

/**
 button图片文字垂直布局
 @param margin 间距
 */
- (void)layoutImageTitleVerticalOffSet:(CGFloat)margin;

/**
 button文字图片垂直布局
 @param margin 间距
 */
- (void)layoutTitleImageVerticalOffSet:(CGFloat)margin;

/**
 button文字图片水平布局
 @param margin 间距
 */
- (void)layoutTitleImageHorizontalOffSet:(CGFloat)margin;

/**
 button图片文字水平布局
 @param margin 间距
 */
- (void)layoutImageTitleHorizontalOffSet:(CGFloat)margin;

@end
