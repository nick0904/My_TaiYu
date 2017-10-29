//
//  BaseViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - For subViewcontrollers  ********
-(void)initWithNavigationBar:(NSString *)navTitle hiddenBackBtn:(BOOL)hiddenBackBtn{
    
    self.navigationItem.title = navTitle;
    
    self.navigationController.navigationBar.barTintColor = COLOR_Normal_Yellow;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_Normal_Brown}];
    
    //左側鍵
    UIButton *left_btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [left_btn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:left_btn];
    
    //右側鍵
    UIButton *right_btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [right_btn setTitleColor:COLOR_Normal_Brown forState:UIControlStateNormal];
    [right_btn addTarget:self action:@selector(backActions) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:right_btn];
    
    if(hiddenBackBtn){
         [right_btn setTitle:@"" forState:UIControlStateNormal];
    }
    else{
         [right_btn setTitle:@"BACK" forState:UIControlStateNormal];
    }
    
    
}


#pragma mark - Basedelegate  ********
-(void)backActions {
    
    [self.delegate backAction];
}

#pragma mark - ParseJson  ********
-(NSMutableDictionary *)parseJson:(NSString *)jsonPath{
    
    NSData * data = [NSData dataWithContentsOfFile:jsonPath];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dic;
}

#pragma mark - show Network Alert  *********
-(void)showNetworkAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意" message:@"請確認您的網路連線" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAciotn = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirmAciotn];
    [self presentViewController:alert animated:YES completion:nil];
}



#pragma mark - NSUserDefault Data  ********
///將資料存至NSUserDefaults
-(void)saveNSUserDefaults:(id)value Key:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}
///從NSUserDefaults讀取資料
-(id)readNSUserDefaults:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:key]) {
        return [userDefaults objectForKey:key];
    }else {
        return @"";
    }
}
///從NSUserDefaults刪除資料
-(void)deleteNSUserDefaults:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}
///判斷NSUserDefault 某個key值是否存在
-(BOOL)determineNSUserDefaultExist:(NSString *)key {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([[[userDefaults dictionaryRepresentation] allKeys] containsObject:key]) {
        return YES;
    }
    return NO;
}


#pragma mark - nav Height + statusbar Height
-(CGFloat)returnNavAndStatusBarHeight{
    
    CGFloat height =  self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    
    return height;
}


#pragma mark - 調整icon長寬比例(中心位置不變)
-(CGRect)fixIconFrame:(CGPoint)center iconWidth:(CGFloat)iconWidth{
    
    CGFloat basicUnit = iconWidth/2;
    
    CGRect newFrame = CGRectMake(center.x - basicUnit, center.y - basicUnit, iconWidth, iconWidth);
    
    return newFrame;
}

@end
