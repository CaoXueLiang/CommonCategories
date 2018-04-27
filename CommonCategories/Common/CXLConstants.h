//
//  CXLConstants.h
//  CommonCategories
//
//  Created by 曹学亮 on 2018/4/27.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>


/*适配iPhoneX需要用到的宏定义*/
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define KTopHeight (kStatusBarHeight + kNavBarHeight)
#define KTarbarHeight (kDevice_Is_iPhoneX ? 83 : 49)
#define KTabbarSafeBottomMargin (kDevice_Is_iPhoneX ? 34 : 0)

