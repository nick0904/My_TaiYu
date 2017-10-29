//
//  PrepareFiveViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "PrepareFiveViewController.h"

@interface PrepareFiveViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView_contentFive;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareOnr;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareTwo;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareThree;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFour;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@end

@implementation PrepareFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"5.檢查檢查再檢查" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.textView_contentFive.contentOffset = CGPointMake(0, 0);
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
    
    [self.btn_prepareOnr addTarget:self action:@selector(gotoPrepareOneVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareTwo addTarget:self action:@selector(gotoPrepareTwoVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareThree addTarget:self action:@selector(gotoPrepareThreeVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFour addTarget:self action:@selector(gotoPrepareFourVC) forControlEvents:UIControlEventTouchUpInside];
}
@end
