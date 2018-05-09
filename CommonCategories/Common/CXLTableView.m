//
//  EIGTableView.m
//  CommonCategories
//
//  Created by 曹学亮 on 2018/3/29.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import "CXLTableView.h"

@implementation CXLTableView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    //关闭iOS11默认开启的self sizing
    [self closeSelfSizing];
}

- (void)closeSelfSizing {
    self.estimatedRowHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
}

@end
