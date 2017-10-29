//
//  OneViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/8.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "OneViewController.h"
#import <SafariServices/SafariServices.h>

@interface OneViewController () <BaseVCDelegate,SFSafariViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *analysis_btn;
@property (strong, nonatomic) IBOutlet UIButton *collage_btn;
@property (strong, nonatomic) IBOutlet UILabel *main_title;
@property (strong, nonatomic) IBOutlet UILabel *sub_label;
@property (strong, nonatomic) IBOutlet UILabel *main_title1;
@property (strong, nonatomic) IBOutlet UILabel *sub_title1;
@property (strong, nonatomic) IBOutlet UILabel *main_title2;
@property (strong, nonatomic) IBOutlet UILabel *sub_title2;
@property (strong, nonatomic) IBOutlet UILabel *main_title3;
@property (strong, nonatomic) IBOutlet UILabel *sub_title3;
@property (strong, nonatomic) IBOutlet UILabel *main_title4;
@property (strong, nonatomic) IBOutlet UILabel *sub_title4;
@property (strong, nonatomic) IBOutlet UILabel *mian_title5;
@property (strong, nonatomic) IBOutlet UILabel *sub_title5;
@property (strong, nonatomic) IBOutlet UIScrollView *m_scrollView;

@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@end

@implementation OneViewController {
    
    SFSafariViewController *safariVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self initWithNavigationBar:@"1111落點分析" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)backAction{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}


#pragma mark - init ************
-(void)initWithUIObjects{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    //self.main_title
    self.main_title.numberOfLines = 0;
    self.main_title.text = @"1111提供免費的成績落點試算服務「1111落點分析」，方便好用的「落點系統」與「職涯導航」功能，可讓同學做好學涯暨職涯規劃！";
    self.main_title.adjustsFontSizeToFitWidth = YES;
    

    [self.sub_title1 sizeToFit];
    [self.sub_title2 sizeToFit];
    [self.sub_title3 sizeToFit];
    [self.sub_title4 sizeToFit];
    [self.sub_title5 sizeToFit];
    
    
    //self.sub_label
    self.sub_label.frame = CGRectMake(0, 0, self.sub_label.frame.size.width, self.sub_label.frame.size.height);
    [self.m_scrollView addSubview:self.sub_label];
    
    //section1
    self.main_title1.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.sub_label.frame), self.main_title1.frame.size.width, self.main_title1.frame.size.height);
    [self.m_scrollView addSubview:self.main_title1];
    
    self.sub_title1.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.main_title1.frame), self.sub_title1.frame.size.width, self.sub_title1.frame.size.height);
    [self.m_scrollView addSubview:self.sub_title1];
    
    //section2
    self.main_title2.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.sub_title1.frame), self.main_title2.frame.size.width, self.main_title2.frame.size.height);
    [self.m_scrollView addSubview:self.main_title2];
    
    self.sub_title2.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.main_title2.frame), self.sub_title2.frame.size.width, self.sub_title2.frame.size.height);
    [self.m_scrollView addSubview:self.sub_title2];
    //section3
    self.main_title3.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.sub_title2.frame), self.main_title3.frame.size.width, self.main_title3.frame.size.height);
    [self.m_scrollView addSubview:self.main_title3];
    
    self.sub_title3.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.main_title3.frame), self.sub_title3.frame.size.width, self.sub_title3.frame.size.height);
    [self.m_scrollView addSubview:self.sub_title3];
    
    //section4
    self.main_title4.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.sub_title3.frame), self.main_title4.frame.size.width, self.main_title4.frame.size.height);
    [self.m_scrollView addSubview:self.main_title4];
    
    self.sub_title4.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.main_title4.frame), self.sub_title4.frame.size.width, self.sub_title4.frame.size.height);
    [self.m_scrollView addSubview:self.sub_title4];
    
    //section5
    self.mian_title5.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.sub_title4.frame), self.mian_title5.frame.size.width, self.mian_title5.frame.size.height);
    [self.m_scrollView addSubview:self.mian_title5];
    
    self.sub_title5.frame = CGRectMake(CGRectGetMinX(self.sub_label.frame), CGRectGetMaxY(self.mian_title5.frame), self.sub_title5.frame.size.width, self.sub_title5.frame.size.height);
    [self.m_scrollView addSubview:self.sub_title5];
    
    //self.m_scrollView
    self.m_scrollView.contentSize = CGSizeMake(self.m_scrollView.frame.size.width,[self refreshScollViewHight]);
    self.m_scrollView.showsHorizontalScrollIndicator = NO;
    
    
    //-------------------------------------------------//
    [self.analysis_btn addTarget:self action:@selector(analysisBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.collage_btn addTarget:self action:@selector(collageBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    //
//    self.sub_title1.adjustsFontSizeToFitWidth = YES;
//    self.sub_title2.adjustsFontSizeToFitWidth = YES;
//    self.sub_title3.adjustsFontSizeToFitWidth = YES;
//    self.sub_title4.adjustsFontSizeToFitWidth = YES;
//    self.sub_title5.adjustsFontSizeToFitWidth = YES;
    
    

}


-(CGFloat)refreshScollViewHight{
    
    return [self returnObjectHeight:self.sub_label]+[self returnObjectHeight:self.main_title1]+[self returnObjectHeight:self.sub_title1]+[self returnObjectHeight:self.main_title2]+[self returnObjectHeight:self.sub_title2]+[self returnObjectHeight:self.main_title3]+[self returnObjectHeight:self.sub_title3]+[self returnObjectHeight:self.main_title4]+[self returnObjectHeight:self.sub_title4]+[self returnObjectHeight:self.mian_title5]+[self returnObjectHeight:self.sub_title5]+10;
}

-(CGFloat)returnObjectHeight:(UILabel *)label{
    return label.frame.size.height;
}


#pragma mark - private Function  *********
-(void)analysisBtnAction{
    
    if(![CheckNetwork isExistenceNetwork]){
        [self showNetworkAlert];
        return;
    }
    
    [self openSafariVCWithURL:@"https://hs.1111.com.tw/?agent=out_analysis_app_taiyucoo"];
}

-(void)collageBtnAction{
    
    if(![CheckNetwork isExistenceNetwork]){
        [self showNetworkAlert];
        return;
    }
    
    [self openSafariVCWithURL:@"http://university.1111.com.tw/"];
}

-(void)openSafariVCWithURL:(NSString *)urlPath{
    
    safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlPath] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
}

@end
