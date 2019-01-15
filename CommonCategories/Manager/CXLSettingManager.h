//
//  EIGSettingManager.h
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CXLSettingManager : NSObject
/**初始化实例*/
+ (CXLSettingManager *)shareManager;

/**清理缓存*/
- (BOOL)clearCache;

/**计算缓存大小*/
- (NSString *)cacheFileSize;


/**
 获取Wifi信息
 @return Wifi信息
 在 iOS 12 及以上系统调用该方法时，需要先在 Xcode 工程中授权获取 WiFi 信息的能力，
 开启路径为：Xcode -> [Project Name] -> Targets -> [Target Name] -> Capabilities -> Access WiFi Information -> ON
 */
+ (NSDictionary *)requestWifiInfo;

@end
