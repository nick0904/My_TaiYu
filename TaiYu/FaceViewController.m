//
//  FaceViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "FaceViewController.h"
#import "FaceInsideViewController.h"

@interface FaceViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btn_info;
@property (strong, nonatomic) IBOutlet UIButton *btn_engineer;
@property (strong, nonatomic) IBOutlet UIButton *btn_finance;
@property (strong, nonatomic) IBOutlet UIButton *btn_massMedia;
@property (strong, nonatomic) IBOutlet UIButton *btn_management;
@property (strong, nonatomic) IBOutlet UIButton *btn_earth;
@property (strong, nonatomic) IBOutlet UIButton *btn_art;
@property (strong, nonatomic) IBOutlet UIButton *btn_language;
@property (strong, nonatomic) IBOutlet UIButton *btn_philosophy;
@property (strong, nonatomic) IBOutlet UIButton *btn_LifeSciences;
@property (strong, nonatomic) IBOutlet UIButton *btn_Education;
@property (strong, nonatomic) IBOutlet UIButton *btn_Psychology;
@property (strong, nonatomic) IBOutlet UIButton *btn_Architecture;
@property (strong, nonatomic) IBOutlet UIButton *btn_sport;
@property (strong, nonatomic) IBOutlet UIButton *btn_Mathematical;
@property (strong, nonatomic) IBOutlet UIButton *btn_Medicine;
@property (strong, nonatomic) IBOutlet UIButton *btn_law;
@property (strong, nonatomic) IBOutlet UIButton *btn_Fishing;


@property (strong, nonatomic) IBOutlet UIView *allBaseView;


@end



@implementation FaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"學群面對面" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - init  *********
-(void)initWithUIObjects {
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    [self customBtn:self.btn_info title:@"資訊"];
    
    [self customBtn:self.btn_engineer title:@"工程"];
    
    [self customBtn:self.btn_finance title:@"財經"];
    
    [self customBtn:self.btn_massMedia title:@"大眾傳播"];
    
    [self customBtn:self.btn_management title:@"管理"];
    
    [self customBtn:self.btn_earth title:@"地球與環境"];
    
    [self customBtn:self.btn_art title:@"藝術"];

    [self customBtn:self.btn_language title:@"外語"];
    
    [self customBtn:self.btn_philosophy title:@"文史哲學"];
    
    [self customBtn:self.btn_LifeSciences title:@"生命科學"];
    
    [self customBtn:self.btn_Education title:@"教育"];
    
    [self customBtn:self.btn_Psychology title:@"社會與心理"];
    
    [self customBtn:self.btn_Architecture title:@"建築與設計"];
    
    [self customBtn:self.btn_sport title:@"遊憩與運動"];
    
    [self customBtn:self.btn_Mathematical title:@"數理化學"];
    
    [self customBtn:self.btn_Medicine title:@"醫藥衛生"];
    
    [self customBtn:self.btn_law title:@"法律政治"];
    
    [self customBtn:self.btn_Fishing title:@"農林漁牧"];
}




#pragma mark - Private Function  ***********
-(void)customBtn:(UIButton *)btn title:(NSString *)title {
    
    //[btn setTitle:title forState:UIControlStateNormal];
    //btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    //[btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoFaceInsideViewController:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)gotoFaceInsideViewController:(UIButton *)btn {
    
    NSString *titleStr;
    
    if(btn == self.btn_info){
        titleStr = @"資訊";
    }
    if(btn == self.btn_engineer){
        titleStr = @"工程";
    }
    if(btn == self.btn_finance){
        titleStr = @"財經";
    }
    if (btn == self.btn_massMedia){
        titleStr = @"大眾傳播";
    }
    if(btn == self.btn_management){
        titleStr = @"管理";
    }
    if(btn == self.btn_earth){
        titleStr = @"地球與環境";
    }
    if(btn == self.btn_art){
        titleStr = @"藝術";
    }
    if(btn == self.btn_language){
        titleStr = @"外語";
    }
    if(btn == self.btn_philosophy){
        titleStr = @"文史哲學";
    }
    if(btn == self.btn_LifeSciences){
        titleStr = @"生命科學";
    }
    if(btn == self.btn_Education){
        titleStr = @"教育";
    }
    if(btn == self.btn_Psychology){
        titleStr = @"社會與心理";
    }
    if(btn == self.btn_Architecture){
        titleStr = @"建築與設計";
    }
    if(btn == self.btn_sport){
        titleStr = @"遊憩與運動";
    }
    if(btn == self.btn_Mathematical){
        titleStr = @"數理化學";
    }
    if(btn == self.btn_Medicine){
        titleStr = @"醫藥衛生";
    }
    if(btn == self.btn_law){
        titleStr = @"法律政治";
    }
    if(btn == self.btn_Fishing){
        titleStr = @"農林漁牧";
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Face" bundle:nil];
    FaceInsideViewController *FaceInsideVC = [storyboard instantiateViewControllerWithIdentifier:@"FaceInsideVC"];
    FaceInsideVC.theTitle = titleStr;
    [self.navigationController pushViewController:FaceInsideVC animated:YES];
}

@end
