//
//  MainTimeViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/4.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "MainTimeViewController.h"

@interface MainTimeViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UITextField *event_textField;
@property (strong, nonatomic) IBOutlet UITextField *date_textField;
@property (strong, nonatomic) IBOutlet UIButton *confirm_btn;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle_label;

@end

@implementation MainTimeViewController {
    
    UIDatePicker *datePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"首頁設定" hiddenBackBtn:NO];
    [self initWithUIObjects];
    [self initWithDate];
    [self initDatePickerView];
}

-(void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.event_textField resignFirstResponder];
    [self.date_textField resignFirstResponder];
}


#pragma mark - init  *********
-(void)initWithUIObjects{
    
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    self.mainTitle_label.adjustsFontSizeToFitWidth = YES;
    
    
    //self.event_textField
    [self.event_textField addTarget:self action:@selector(checkTextLength:) forControlEvents:UIControlEventEditingChanged];
    
    //self.confirm_btn
    [self.confirm_btn addTarget:self action:@selector(confirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Private Function  ********
-(void)checkTextLength:(UITextField *)textField{
    
    if(textField.text.length > 7){
        textField.text = [textField.text substringWithRange:NSMakeRange(0, 7)];
    }
}

-(void)confirmBtnAction{
    
    if(self.event_textField.text.length == 0 || [self.event_textField.text isEqualToString:@""]){
        [self showAlert:@"請輸入事件內容" message:@""];
        return;
    }
    
    [self saveNSUserDefaults:self.event_textField.text Key:Setting_Time_Target];
    [self saveNSUserDefaults:self.date_textField.text Key:Setting_Time_Date];
    
    [self gotoMainPageVC];
}

-(void)showAlert:(NSString *)title message:(NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirm];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)gotoMainPageVC{
    
    [self deleteNSUserDefaults:Setting_MainImage];
    [self deleteNSUserDefaults:Setting_Target];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}


#pragma mark - date
-(void)initWithDate{
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY/MM/dd"];
    NSString *currentStr = [formatter stringFromDate:currentDate];
    self.date_textField.text = currentStr;
}

//初始化 datePicker
-(void)initDatePickerView{
    
    if(datePicker == nil){
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/3*2, self.view.frame.size.width, self.view.frame.size.height/3)];
    }
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.minimumDate = [NSDate date];
    datePicker.date = [NSDate date];
    datePicker.backgroundColor = [UIColor whiteColor];
    self.date_textField.inputView = datePicker;
    [self addDateConfirmToolBar];
}

-(void)addDateConfirmToolBar{
    UIBarButtonItem *dateConfirm = [[UIBarButtonItem alloc] initWithTitle:@"確定" style:UIBarButtonItemStylePlain target:self action:@selector(refreshDate)];
    UIBarButtonItem *itemSpring = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *nonBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIToolbar *dateToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, datePicker.frame.size.width, 45)];
    [dateToolBar setItems:@[nonBtn,itemSpring,dateConfirm] animated:NO];
    self.date_textField.inputAccessoryView = dateToolBar;
}

//更新所選擇的時間
-(void)refreshDate{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY/MM/dd"];
    self.date_textField.text = [formatter stringFromDate:datePicker.date];
    [self.date_textField resignFirstResponder];
}
@end
