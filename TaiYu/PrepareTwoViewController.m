//
//  PrepareTwoViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "PrepareTwoViewController.h"

@interface PrepareTwoViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UITextView *text_contextTwo;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareOne;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareThree;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFour;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFive;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@end

@implementation PrepareTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"2.架構有條理" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.text_contextTwo.contentOffset = CGPointMake(0, 0);
}

-(void)backAction {
    [self gotoPrepareVC];
}

#pragma mark - init  *********
-(void)initWithUIObjects {
    
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    
    [self.btn_prepareOne addTarget:self action:@selector(gotoPrepareOneVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareThree addTarget:self action:@selector(gotoPrepareThreeVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFour addTarget:self action:@selector(gotoPrepareFourVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFive addTarget:self action:@selector(gotoPrepareFiveVC) forControlEvents:UIControlEventTouchUpInside];
    
}

@end
