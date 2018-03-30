//
//  UIImage+CXLCommon.h
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CXLCommon)
/// 旋转多少度
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;

/// 调整图片方向
- (UIImage *)fixOrientation;
@end
