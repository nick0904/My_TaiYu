//
//  LifeStoryViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/1.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "LifeStoryViewController.h"
#import "LifeStoryInsideViewController.h"

@interface LifeStoryViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UILabel *mianLabel;
@property (strong, nonatomic) IBOutlet UIButton *btn_discovery;
@property (strong, nonatomic) IBOutlet UIButton *btn_celebrity;
@property (strong, nonatomic) IBOutlet UIButton *btn_story;
@property (strong, nonatomic) IBOutlet UIButton *btn_dreams;

@end

@implementation LifeStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self initWithNavigationBar:@"生涯故事" hiddenBackBtn:NO];
    [self initWithUIObjs];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backAction{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}


#pragma mark - init  ********
-(void)initWithUIObjs{
    
    //self.mianLabel
    self.mianLabel.numberOfLines = 0;
    self.mianLabel.text = @"聆聽其他人的生命故事，可以成為我們探索自己的養分，跟著前人的步伐，嘗試走出自己的路！";
    
    //self.btn_discovery
    [self customBtn:self.btn_discovery title:@"自我探索好文"];
    
    //self.btn_celebrity
    [self customBtn:self.btn_celebrity title:@"名人生涯好文"];
    
    //self.btn_story
    [self customBtn:self.btn_story title:@"生命故事影片"];
    
    //self.btn_dreams
    [self customBtn:self.btn_dreams title:@"職業追夢影片"];
}


#pragma mark - Private Function  *******
-(void)customBtn:(UIButton *)btn title:(NSString *)title {
    
    //[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //btn.titleLabel.numberOfLines = 0;
    //btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(gotoLifeStoryInsideVC:) forControlEvents:UIControlEventTouchUpInside];
    //[btn setTitle:title forState:UIControlStateNormal];
}
    
-(void)gotoLifeStoryInsideVC:(UIButton *)btn{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LifeStory" bundle:nil];
    LifeStoryInsideViewController *LifeStoryInsideVC = [storyboard instantiateViewControllerWithIdentifier:@"LifeStoryInsideVC"];
    
    if(btn == self.btn_discovery){
        LifeStoryInsideVC.lifeStory_type = EnumLifeStory_0;
    }
    else if (btn == self.btn_celebrity){
        LifeStoryInsideVC.lifeStory_type = EnumLifeStory_1;
    }
    else if (btn == self.btn_story){
        LifeStoryInsideVC.lifeStory_type = EnumLifeStory_2;
    }
    else{
        LifeStoryInsideVC.lifeStory_type = EnumLifeStory_3;
    }
    
    [self.navigationController pushViewController:LifeStoryInsideVC animated:YES];
}

@end
