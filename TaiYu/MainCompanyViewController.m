//
//  MainCompanyViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/4.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "MainCompanyViewController.h"

@interface MainCompanyViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle_label;

@end

@implementation MainCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self initWithNavigationBar:@"首頁設定" hiddenBackBtn:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    self.mainTitle_label.adjustsFontSizeToFitWidth = YES;
}


-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
