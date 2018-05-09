//
//  CXLMainController.m
//  CommonCategories
//
//  Created by bjovov on 2018/3/23.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import "CXLMainController.h"
#import "CXLSettingManager.h"

@interface CXLMainController ()

@end

@implementation CXLMainController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSString *cacheFile = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"%@",cacheFile);
    
    NSString *str = [[CXLSettingManager shareManager] cacheFileSize];
    NSLog(@"%@",str);
   // [[CXLSettingManager shareManager] clearCache];
    NSString *currentStr = [[CXLSettingManager shareManager] cacheFileSize];
    NSLog(@"%@",currentStr);
}


@end
