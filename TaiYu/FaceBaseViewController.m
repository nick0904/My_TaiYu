//
//  FaceBaseViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/15.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "FaceBaseViewController.h"

@interface FaceBaseViewController ()<BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btn_18;
@property (strong, nonatomic) IBOutlet UIButton *btn_21;
@property (strong, nonatomic) IBOutlet UILabel *title_label;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@end

@implementation FaceBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    [self initWithNavigationBar:@"學群面對面" hiddenBackBtn:NO];
    [self initWithUIObjs];
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


#pragma mark - init  *********
-(void)initWithUIObjs{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    
    self.title_label.numberOfLines = 0;
    self.title_label.text = @"普通高中升大學時，可以參考大考中心所分類的「18學群」；技術高中升四技二專時，則依招生類別分成「21群類」。同學們可依此分類找到自己有興趣的類別與科系，聽聽學長姐和老師們對於目標科系的分享！";
    self.title_label.adjustsFontSizeToFitWidth = YES;
    
    
    [self.btn_18 addTarget:self action:@selector(btn18Action) forControlEvents:UIControlEventTouchUpInside];
    [self.btn_21 addTarget:self action:@selector(btn21Action) forControlEvents:UIControlEventTouchUpInside];
    
}


#pragma mark - Private Function  ********
-(void)btn18Action{
    NSLog(@"18888");
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Face" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"FaceVC"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btn21Action{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Face" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Face21"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
