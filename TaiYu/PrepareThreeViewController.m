//
//  PrepareThreeViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "PrepareThreeViewController.h"

@interface PrepareThreeViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UITextView *text_contextThree;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareOne;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareTwo;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFour;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFive;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@end

@implementation PrepareThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"3.平時的累積" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.text_contextThree.contentOffset = CGPointMake(0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)backAction {
    [self gotoPrepareVC];
}


#pragma mark - init  ********
-(void)initWithUIObjects {
    
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    [self.btn_prepareOne addTarget:self action:@selector(gotoPrepareOneVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareTwo addTarget:self action:@selector(gotoPrepareTwoVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFour addTarget:self action:@selector(gotoPrepareFourVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFive addTarget:self action:@selector(gotoPrepareFiveVC) forControlEvents:UIControlEventTouchUpInside];
}

@end
