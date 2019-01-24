//
//  UIImage+CXLCommon.h
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (CXLCommon)
/**
 旋转图片
 @param degrees 度数
 @return 旋转后的图片
 */
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;


/**
 调整图片方向
 @return 正方向图片
 */
- (UIImage *)fixOrientation;


/**
 设置图片的主题色
 @param tintColor 主题色
 @return 图片
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;


/**
 设置有渐变颜色的图片的渐变色
 @param tintColor 主题色
 @return 图片
 */
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;


@end
