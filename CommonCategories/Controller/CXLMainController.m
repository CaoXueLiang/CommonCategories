//
//  CXLMainController.m
//  CommonCategories
//
//  Created by bjovov on 2018/3/23.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import "CXLMainController.h"
#import "CXLSettingManager.h"
#import "UIImage+CXLCommon.h"

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
    
    if ([[CXLSettingManager shareManager] clearCache]) {
        
    }
    
    
    UIImage *tmpImage = [[UIImage imageNamed:@"image"] imageWithGradientTintColor:[UIColor redColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    [self.view addSubview:imageView];
    imageView.image = tmpImage;
    
    
    UIImage *originalImage = [UIImage imageNamed:@"image"];
    UIImageView *rightimageView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 100, 100, 100)];
    [self.view addSubview:rightimageView];
    rightimageView.image = originalImage;
}


@end
