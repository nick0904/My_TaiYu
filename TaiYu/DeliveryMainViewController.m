//
//  DeliveryMainViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/9.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "DeliveryMainViewController.h"

@interface DeliveryMainViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@property (strong, nonatomic) IBOutlet UILabel *main_label;

@end

@implementation DeliveryMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"面試快選" hiddenBackBtn:NO];
    [self initWithUIObject];
}

-(void)backAction{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init *********
-(void)initWithUIObject{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    self.main_label.text = @"當收到面試通知之後，就要進行面試的準備了，你清楚面試前、面試中、面試後該注意的細節嗎？簡單10個題目測試一下你有多少「面試力」！";
    self.main_label.adjustsFontSizeToFitWidth = YES;
}

#pragma mark - Private Function  *********
- (IBAction)gotoDelivertChooseVC:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Delivery" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"DeliveryChooseVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
