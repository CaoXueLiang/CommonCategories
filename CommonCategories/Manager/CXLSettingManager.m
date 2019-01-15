//
//  EIGSettingManager.m
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import "CXLSettingManager.h"
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation CXLSettingManager
+ (CXLSettingManager *)shareManager{
    static CXLSettingManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CXLSettingManager alloc]init];
        
    });
    return manager;
}

- (BOOL)clearCache {
   __block BOOL isSucess = YES;
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //这里清除 Library/Caches 里的所有文件
        NSString *cachPath =
        [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        
        for (NSString *p in files) {
            NSError *error;
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
               BOOL removeSucess = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
               if (!removeSucess) {
                    isSucess = NO;
              }
            }
         }
    });
    return isSucess;
}

- (NSString *)cacheFileSize;{
    NSString *cacheFile = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    CGFloat fileSize = [self folderSizeAtPath:cacheFile];
    NSString *size =[NSString stringWithFormat:@"%.2fMB",fileSize];
    return size;
}

- (CGFloat)folderSizeAtPath:(NSString *)folderPath{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        return 0;
    }
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName = nil;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

- (long long)fileSizeAtPath:(NSString *)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

+ (NSDictionary *)requestWifiInfo{
    CFArrayRef wifis = CNCopySupportedInterfaces();
    if (!wifis || CFArrayGetCount(wifis) == 0) {
        return nil;
    }
    NSArray *interfaces = (__bridge_transfer NSArray *)wifis;
    NSDictionary *info = nil;
    for (NSString *name in interfaces) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)name);
    }
    return info;
}

@end

