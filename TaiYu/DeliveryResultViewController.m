//
//  DeliveryResultViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/3.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "DeliveryResultViewController.h"

@interface DeliveryResultViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *result_imgView;
@property (strong, nonatomic) IBOutlet UILabel *result_label;

@end

@implementation DeliveryResultViewController
@synthesize result_point;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"面試快選" hiddenBackBtn:NO];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self getResult];
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



#pragma mark - Private Function  **********
-(void)getResult{
    
    if(result_point >= 100){
        self.result_imgView.image = [UIImage imageNamed:DeliveryResult_100_img];
        self.result_label.text = DeliveryResult_100;
    }
    else if(result_point >= 70 && result_point <= 90){
        self.result_imgView.image = [UIImage imageNamed:DeliveryResult_90_70_img];
        self.result_label.text = DeliveryResult_90_70;
    }
    else if(result_point >= 40 && result_point <= 60){
        self.result_imgView.image = [UIImage imageNamed:DeliveryResult_60_40_img];
        self.result_label.text = DeliveryResult_60_40;
    }
    else if(result_point >= 10 && result_point <= 30){
        self.result_imgView.image = [UIImage imageNamed:DeliveryResult_30_10_img];
        self.result_label.text = DeliveryResult_30_10;
    }
    else{
        self.result_imgView.image = [UIImage imageNamed:DeliveryResult_0_img];
        self.result_label.text = DeliveryResult_0;
    }
    
    self.result_imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.result_label.numberOfLines = 0;
}

@end
