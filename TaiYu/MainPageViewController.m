//
//  MainPageViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()


@property (strong, nonatomic) IBOutlet UIButton *btn_1111;
@property (strong, nonatomic) IBOutlet UIButton *btn_taiwan;
@property (strong, nonatomic) IBOutlet UIButton *btn_18;
@property (strong, nonatomic) IBOutlet UIButton *btn_prepareInfo;
@property (strong, nonatomic) IBOutlet UIButton *btn_goodlife;
@property (strong, nonatomic) IBOutlet UIButton *btn_delivery;
@property (strong, nonatomic) IBOutlet UIButton *btn_interview;
@property (strong, nonatomic) IBOutlet UIButton *btn_video;
@property (strong, nonatomic) IBOutlet UIButton *btn_lifeStory;
@property (strong, nonatomic) IBOutlet UIButton *btn_setting;


//====================
@property (strong, nonatomic) IBOutlet UIImageView *main_imgView;
//--------------------
@property (strong, nonatomic) IBOutlet UIView *target_view;
@property (strong, nonatomic) IBOutlet UILabel *target_label;
//--------------------
@property (strong, nonatomic) IBOutlet UIView *time_view;
@property (strong, nonatomic) IBOutlet UILabel *time_label;
@property (strong, nonatomic) IBOutlet UILabel *time_date_label;

//====================


@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithNavigationBar:@"泰宇生涯導航員" hiddenBackBtn:YES];
    
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self showMainImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - init  **********
-(void)initWithUIObjects {
    
    //self.btn_1111
    [self customBtn:self.btn_1111 title:@"人力銀行\n落點分析"];
    [self.btn_1111 addTarget:self action:@selector(goto1111ViewController) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_taiwan
    [self customBtn:self.btn_taiwan title:@"全台灣\n大專院校"];
    [self.btn_taiwan addTarget:self action:@selector(gotoAllTaiwanViewController) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_18
    [self customBtn:self.btn_18 title:@"學群面對面"];
    [self.btn_18 addTarget:self action:@selector(gotoFaceViewController) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_prepareInfo
    [self customBtn:self.btn_prepareInfo title:@"備審資料\n怎麼做?"];
    [self.btn_prepareInfo addTarget:self action:@selector(gotoPrepareViewController) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_goodlife
    [self customBtn:self.btn_goodlife title:@"生涯好站"];
    [self.btn_goodlife addTarget:self action:@selector(gotoGoodLifeViewController) forControlEvents:UIControlEventTouchUpInside];
    
    
    //self.btn_delivery
    [self customBtn:self.btn_delivery title:@"面試快選"];
    [self.btn_delivery addTarget:self action:@selector(gotoDeliveryMainViewController) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_lifeStory
    [self customBtn:self.btn_lifeStory title:@"生涯故事"];
    [self.btn_lifeStory addTarget:self action:@selector(gotoLifeStoryViewController) forControlEvents:UIControlEventTouchUpInside];
    
    
    //self.btn_interview
    [self customBtn:self.btn_interview title:@"虛擬面試台"];
    [self.btn_interview addTarget:self action:@selector(gotoVirtualVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    //self.btn_video
    [self customBtn:self.btn_video title:@"錄製影音履歷"];
    [self.btn_video addTarget:self action:@selector(gotoInterViewVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    //self.btn_setting
    [self.btn_setting addTarget:self action:@selector(gotoMainPageSettingVC) forControlEvents:UIControlEventTouchUpInside];
}




#pragma mark - Private Function  ************
-(void)customBtn:(UIButton *)btn title:(NSString *)title {
    
//    btn.titleLabel.numberOfLines = 0;
//    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    [btn setTitle:title forState:UIControlStateNormal];
    
}


///1111
-(void)goto1111ViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"One" bundle:nil];
    UINavigationController *OneNav = [storyboard instantiateViewControllerWithIdentifier:@"OneNav"];
    [self.appdelegate.window setRootViewController:OneNav];
    [self.appdelegate.window makeKeyWindow];
}

///全台大專院校
-(void)gotoAllTaiwanViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AllTaiwan" bundle:nil];
    UINavigationController *AllTaiwanNav = [storyboard instantiateViewControllerWithIdentifier:@"AllTaiwanNav"];
    [self.appdelegate.window setRootViewController:AllTaiwanNav];
    [self.appdelegate.window makeKeyWindow];
}

///18學群面對面
-(void)gotoFaceViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Face" bundle:nil];
    UINavigationController *FaceNav = [storyboard instantiateViewControllerWithIdentifier:@"FaceNav"];
    [self.appdelegate.window setRootViewController:FaceNav];
    [self.appdelegate.window makeKeyWindow];
}

///備審資料
-(void)gotoPrepareViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PrepareInfo" bundle:nil];
    UINavigationController *PrepareInfoNav = [storyboard instantiateViewControllerWithIdentifier:@"PrepareInfoNav"];
    [self.appdelegate.window setRootViewController:PrepareInfoNav];
    [self.appdelegate.window makeKeyWindow];
}

///生涯好站
-(void)gotoGoodLifeViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GoodLife" bundle:nil];
    UINavigationController *GoodLifeNav = [storyboard instantiateViewControllerWithIdentifier:@"GoodLifeNav"];
    [self.appdelegate.window setRootViewController:GoodLifeNav];
    [self.appdelegate.window makeKeyWindow];
}


///生涯故事
-(void)gotoLifeStoryViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LifeStory" bundle:nil];
    UINavigationController *LifeStoryNav = [storyboard instantiateViewControllerWithIdentifier:@"LifeStoryNav"];
    [self.appdelegate.window setRootViewController:LifeStoryNav];
    [self.appdelegate.window makeKeyWindow];
}


///面試快選
-(void)gotoDeliveryMainViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Delivery" bundle:nil];
    UINavigationController *DeliveryNav = [storyboard instantiateViewControllerWithIdentifier:@"DeliveryNav"];
    [self.appdelegate.window setRootViewController:DeliveryNav];
    [self.appdelegate.window makeKeyWindow];
}


///虛擬面試
-(void)gotoVirtualVC{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Virtual" bundle:nil];
    UINavigationController *VirtualNav = [storyboard instantiateViewControllerWithIdentifier:@"VirtualNav"];
    [self.appdelegate.window setRootViewController:VirtualNav];
    [self.appdelegate.window makeKeyWindow];
}

///錄製影音履歷
-(void)gotoInterViewVC{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"InterView" bundle:nil];
    UINavigationController *InterViewNav = [storyboard instantiateViewControllerWithIdentifier:@"InterViewNav"];
    [self.appdelegate.window setRootViewController:InterViewNav];
    [self.appdelegate.window makeKeyWindow];
}

///首頁設定
-(void)gotoMainPageSettingVC{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainSettingVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - showMainImage **********
-(void)showMainImage{
    
    if([self determineNSUserDefaultExist:Setting_Target] == YES){
        //show
        self.target_view.hidden = NO;
        NSString *target_text = (NSString *)[self readNSUserDefaults:Setting_Target];
        self.target_label.text = target_text;
        self.target_label.textColor = COLOR_Normal_Brown;
        
        //hidden
        self.main_imgView.hidden = YES;
        self.time_view.hidden = YES;
    }
    else if([self determineNSUserDefaultExist:Setting_Time_Target] == YES){
        //show
        self.time_view.hidden = NO;
        self.time_label.textColor = COLOR_Normal_Brown;
        self.time_date_label.textColor = COLOR_Normal_Brown;
        [self customTextFont];
        self.time_date_label.text = [NSString stringWithFormat:@"%d天",[self getDay]];
        
        //hidden
        self.main_imgView.hidden = YES;
        self.target_view.hidden = YES;
    }
    else{
        //show
        self.main_imgView.hidden = NO;
        if([self determineNSUserDefaultExist:Setting_MainImage] == YES){
            self.main_imgView.image = [UIImage imageWithData:(NSData *)[self readNSUserDefaults:Setting_MainImage]];
        }
        else{
            self.main_imgView.image = [UIImage imageNamed:@"title_image"];
        }
        
        //hidden
        self.target_view.hidden = YES;
        self.time_view.hidden= YES;
    }
}

-(NSString *)getSettingTimeTargetText:(NSString *)oriStr{
    
    NSString *finalStr = [NSString stringWithFormat:@"距離%@還有:",oriStr];
    return finalStr;
}
-(void)customTextFont{
    
    NSString* str = [self getSettingTimeTargetText:(NSString *)[self readNSUserDefaults:Setting_Time_Target]];
    NSInteger textLength = str.length-5;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedString setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30]} range:NSMakeRange(2, textLength)];
    self.time_label.attributedText = attributedString;
    self.time_label.adjustsFontSizeToFitWidth = YES;
}

//時間差
-(int)getDay{
 
    int dayCount = 0;
    
    //現在時間
    NSDate *now = [NSDate date];
    
    //目標時間
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"YYYY/MM/dd"];
    NSDate *targetDate = [matter dateFromString:[self readNSUserDefaults:Setting_Time_Date]];
    
    //利用日曆計算時間差
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:type fromDate:now toDate:targetDate options:0];
    NSLog(@"時間差:%ld年%ld月%ld日",cmps.year,cmps.month,cmps.day);
    
    //現在時間格式化
    NSString *nowStr = [matter stringFromDate:now];
    
    if([nowStr isEqualToString:[self readNSUserDefaults:Setting_Time_Date]]){
        dayCount = 0;
    }
    else{
        dayCount = (int)cmps.day + 1;
    }
    
    if(cmps.year>0){
        int yearToDay = (int)cmps.year *365;
        dayCount += yearToDay;
    }
    if(cmps.month>0){
        
        int monthToDay = (int)cmps.month * 30;
        dayCount += monthToDay;
    }
 
    return dayCount;
}

@end
