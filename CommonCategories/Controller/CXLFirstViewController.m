//
//  CXLFirstViewController.m
//  CommonCategories
//
//  Created by 曹学亮 on 2019/1/23.
//  Copyright © 2019 caoxueliang.cn. All rights reserved.
//

#import "CXLFirstViewController.h"
#import "CXLCommonManager.h"

@interface CXLFirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *outImageView;

@end

static NSString  *KURLString = @"http://cn.bing.com/?FORM=BEHPTB";
@implementation CXLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Code Generator";
    self.outImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.outImageView.image = [CXLCommonManager createAzteCodeWithString:KURLString size:CGSizeMake(300, 300)];
}


- (IBAction)segmentControlChanged:(id)sender {
    UISegmentedControl *segment = sender;
    if (segment.selectedSegmentIndex == 0) {
        self.outImageView.image = [CXLCommonManager createAzteCodeWithString:KURLString size:CGSizeMake(300, 300)];
    }else{
        self.outImageView.image = [CXLCommonManager createBarCodeWithString:KURLString size:CGSizeMake(300, 100)];
    }
}

@end
