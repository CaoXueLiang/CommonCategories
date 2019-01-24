//
//  NSString+CXLCommon.h
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CXLCommon)
/// 匹配电话号码
- (BOOL)isPhoneNumber;

/// 匹配邮箱
- (BOOL)isEmail;

/// 匹配用户名或密码
- (BOOL)isUserNameOrPassword;

/// 匹配银行卡号
- (BOOL)isBankNumber;

/// 匹配QQ号码
- (BOOL)isQQNumber;

/// 匹配IP地址
- (BOOL)isIPAdress;

//-----------------------------------------------
/// 转换拼音
- (NSString *)transformToPinyin;

/// 去掉 HTML 字符串中的标签
- (NSString *)filterHTML:(NSString *)html;

@end
