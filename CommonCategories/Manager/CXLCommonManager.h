//
//  CXLCommonManager.h
//  CommonCategories
//
//  Created by 曹学亮 on 2019/1/23.
//  Copyright © 2019 caoxueliang.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXLCommonManager : NSObject

/**
 生成二维码
 @param string 字符串
 @param imageSize 图片大小
 @return 二维码图片
 */
+ (UIImage *)createAzteCodeWithString:(NSString *)string size:(CGSize)imageSize;


/**
 生成条形码
 @param string 字符串
 @param imageSize 生成的图片大小
 @return 条形码图片
 */
+ (UIImage *)createBarCodeWithString:(NSString *)string size:(CGSize)imageSize;
@end

NS_ASSUME_NONNULL_END
