//
//  EIGSettingManager.m
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import "EIGSettingManager.h"

@implementation EIGSettingManager
//清理缓存
+ (void)clearCache {
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //这里清除 Library/Caches 里的所有文件
        NSString *cachPath =
        [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        
        for (NSString *p in files) {
            NSError *error;
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
    });
}
@end
