//
//  PrepareViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "PrepareViewController.h"

@interface PrepareViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView_context;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareOne;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareTwo;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareThree;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFour;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareFive;

@end

@implementation PrepareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"備審資料怎麼做" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.textView_context.contentOffset = CGPointMake(0, 0);
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


#pragma mark - Private Function  ***********
-(void)initWithUIObjects {
    
    self.textView_context.text = @"各位高中生們，恭喜通過第一階段的成績審查，接下來要做的就是準備備審資料囉！普通高中申請大學、技術高中申請四技二專時，都須依據大學各校系的指定項目製作備審資料。\n\n※格式注意：\n自103學年度起，大學繳交備審資料的方式已全面改為上傳電子檔的線上書審。\n\n自106學年度起，四技二專申請入學中，包含電機與電子群電機類等共6個學群5成書審採網路上傳電子檔的線上書審，5成保持繳交紙本備審資料的形式。\n\n以下是5大製作備審資料的注意事項：(點擊看解說)\n1.內容的選擇\n2.架構有條理\n3.平時的累積\n4.適時加入圖表與美編\n5.檢查檢查再檢查\n";
    
    [self.btn_prepareOne addTarget:self action:@selector(gotoPrepareOneVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareTwo addTarget:self action:@selector(gotoPrepareTwoVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareThree addTarget:self action:@selector(gotoPrepareThreeVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFour addTarget:self action:@selector(gotoPrepareFourVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn_prepareFive addTarget:self action:@selector(gotoPrepareFiveVC) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Public Function  *************
/**
 PrepareInfoNav
 PrepareVC
 PrepareOneVC
 PrepareTwoVC
 PrepareThreeVC
 PrepareFourVC
 PrepareFiveVC
 */
-(void)gotoPrepareVC {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)gotoPrepareOneVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PrepareInfo" bundle:nil];
    UIViewController *PrepareOneVC = [storyboard instantiateViewControllerWithIdentifier:@"PrepareOneVC"];
    [self.navigationController pushViewController:PrepareOneVC animated:YES];
    
}

-(void)gotoPrepareTwoVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PrepareInfo" bundle:nil];
    UIViewController *PrepareTwoVC = [storyboard instantiateViewControllerWithIdentifier:@"PrepareTwoVC"];
    [self.navigationController pushViewController:PrepareTwoVC animated:YES];
}

-(void)gotoPrepareThreeVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PrepareInfo" bundle:nil];
    UIViewController *PrepareThreeVC = [storyboard instantiateViewControllerWithIdentifier:@"PrepareThreeVC"];
    [self.navigationController pushViewController:PrepareThreeVC animated:YES];
}

-(void)gotoPrepareFourVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PrepareInfo" bundle:nil];
    UIViewController * PrepareFourVC = [storyboard instantiateViewControllerWithIdentifier:@"PrepareFourVC"];
    [self.navigationController pushViewController: PrepareFourVC animated:YES];
}

-(void)gotoPrepareFiveVC {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PrepareInfo" bundle:nil];
    UIViewController *PrepareFiveVC = [storyboard instantiateViewControllerWithIdentifier:@"PrepareFiveVC"];
    [self.navigationController pushViewController:PrepareFiveVC animated:YES];
}
@end
