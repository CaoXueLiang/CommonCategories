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
#import "CXLFirstViewController.h"

@interface CXLMainController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation CXLMainController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
//    NSString *cacheFile = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSLog(@"%@",cacheFile);
//
//    NSString *str = [[CXLSettingManager shareManager] cacheFileSize];
//    NSLog(@"%@",str);
//   // [[CXLSettingManager shareManager] clearCache];
//
//    if ([[CXLSettingManager shareManager] clearCache]) {
//
//    }
//
//
//    UIImage *tmpImage = [[UIImage imageNamed:@"image"] imageWithGradientTintColor:[UIColor redColor]];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
//    [self.view addSubview:imageView];
//    imageView.image = tmpImage;
//
//
//    UIImage *originalImage = [UIImage imageNamed:@"image"];
//    UIImageView *rightimageView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 100, 100, 100)];
//    [self.view addSubview:rightimageView];
//    rightimageView.image = originalImage;
    
    [self.view addSubview:self.tableView];
}

#pragma UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CXLFirstViewController *controller = [[CXLFirstViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1){
        
    }
}

#pragma mark - Setter && Getter
- (UITableView *)tableView {
    if (!_tableView) {
        CGSize KSSREEN_BOUNDS = [UIScreen mainScreen].bounds.size;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KSSREEN_BOUNDS.width, KSSREEN_BOUNDS.height - 64) style:UITableViewStylePlain];
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"二维码"];
    }
    return _dataArray;
}

@end
