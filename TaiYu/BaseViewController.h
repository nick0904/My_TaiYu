//
//  BaseViewController.h
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseVCDelegate <NSObject>

@optional

-(void)backAction;

@end




@interface BaseViewController : UIViewController

@property (strong,nonatomic) AppDelegate *appdelegate;

@property (nonatomic) id<BaseVCDelegate>delegate;

-(void)initWithNavigationBar:(NSString *)navTitle hiddenBackBtn:(BOOL)hiddenBackBtn;

-(NSMutableDictionary *)parseJson:(NSString *)jsonPath;

-(void)showNetworkAlert;

//NSUserDefault Data
-(BOOL)determineNSUserDefaultExist:(NSString *)key;
-(void)saveNSUserDefaults:(id)value Key:(NSString *)key;
-(id)readNSUserDefaults:(NSString *)key;
-(void)deleteNSUserDefaults:(NSString *)key;

-(CGFloat)returnNavAndStatusBarHeight;


//調整icon長寬比例(中心位置不變)
-(CGRect)fixIconFrame:(CGPoint)center iconWidth:(CGFloat)iconWidth;


@end
