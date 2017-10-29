//
//  GoodLifeViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "GoodLifeViewController.h"
#import "GoodLifeInsideViewController.h"

@interface GoodLifeViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UILabel *label_context;

@property (strong, nonatomic) IBOutlet UIButton *btn_info;
@property (strong, nonatomic) IBOutlet UILabel *info_label;


@property (strong, nonatomic) IBOutlet UIButton *btn_department;
@property (strong, nonatomic) IBOutlet UILabel *department_label;



@property (strong, nonatomic) IBOutlet UIButton *btn_HR;
@property (strong, nonatomic) IBOutlet UILabel *hr_label;



@property (strong, nonatomic) IBOutlet UIButton *btn_others;
@property (strong, nonatomic) IBOutlet UILabel *others_label;


@end

@implementation GoodLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"生涯好站" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backAction {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}


#pragma mark - init  *******
-(void)initWithUIObjects {
    
    self.label_context.text = @"對於未來感到迷茫嗎？\n也許下面的網站能夠幫助你，給你一些建議唷！";
    
    [self customBtn:self.btn_info title:@"大考及國內\n升學資訊"];
    self.info_label.adjustsFontSizeToFitWidth = YES;
    
    [self customBtn:self.btn_department title:@"大專校院科系\n及落點分析"];
    self.department_label.adjustsFontSizeToFitWidth = YES;
    
    [self customBtn:self.btn_HR title:@"職場人力需求"];
    self.hr_label.adjustsFontSizeToFitWidth = YES;
    
    [self customBtn:self.btn_others title:@"其他生涯探索\n與終身學習"];
    self.others_label.adjustsFontSizeToFitWidth = YES;
}


#pragma mark - Private Function  *******
-(void)customBtn:(UIButton *)btn title:(NSString *)title {
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //btn.titleLabel.numberOfLines = 0;
    //btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(gotoGoodLifeInsideVC:) forControlEvents:UIControlEventTouchUpInside];
    //[btn setTitle:title forState:UIControlStateNormal];
}

-(void)gotoGoodLifeInsideVC:(UIButton *)btn{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GoodLife" bundle:nil];
    GoodLifeInsideViewController *GoodLifeInsideVC = [storyboard instantiateViewControllerWithIdentifier:@"GoodLifeInsideVC"];
    
    if(btn == self.btn_info){
        GoodLifeInsideVC.m_type = EnumGoodLife_0;
    }
    else if (btn == self.btn_department){
        GoodLifeInsideVC.m_type = EnumGoodLife_1;
    }
    else if (btn == self.btn_HR){
        GoodLifeInsideVC.m_type = EnumGoodLife_2;
    }
    else{
        GoodLifeInsideVC.m_type = EnumGoodLife_3;
    }
    
    [self.navigationController pushViewController:GoodLifeInsideVC animated:YES];
    
}


@end
