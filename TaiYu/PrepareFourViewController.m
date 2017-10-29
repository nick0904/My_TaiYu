//
//  PrepareFourViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "PrepareFourViewController.h"

@interface PrepareFourViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView_contextFour;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareOne;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareTwo;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareThree;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFive;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@end

@implementation PrepareFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"4.適時加入圖表與美編" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.textView_contextFour.contentOffset = CGPointMake(0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backAction {
    [self gotoPrepareVC];
}


#pragma mark - init  ***********
-(void)initWithUIObjects {
    
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    [self.btn_prepareOne addTarget:self action:@selector(gotoPrepareOneVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareTwo addTarget:self action:@selector(gotoPrepareTwoVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareThree addTarget:self action:@selector(gotoPrepareThreeVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFive addTarget:self action:@selector(gotoPrepareFiveVC) forControlEvents:UIControlEventTouchUpInside];
}

@end
