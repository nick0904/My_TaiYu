//
//  PrepareOneViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "PrepareOneViewController.h"

@interface PrepareOneViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView_contextOne;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareTwo;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareThree;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFour;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFive;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;


@end

@implementation PrepareOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self initWithNavigationBar:@"1.內容的選擇" hiddenBackBtn:NO];
    
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.textView_contextOne.contentOffset = CGPointMake(0, 0);
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
    
    [self.btn_prepareTwo addTarget:self action:@selector(gotoPrepareTwoVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareThree addTarget:self action:@selector(gotoPrepareThreeVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFour addTarget:self action:@selector(gotoPrepareFourVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFive addTarget:self action:@selector(gotoPrepareFiveVC) forControlEvents:UIControlEventTouchUpInside];
    
}

@end
