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

@end
