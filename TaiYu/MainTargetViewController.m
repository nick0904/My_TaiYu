//
//  MainTargetViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/4.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "MainTargetViewController.h"

@interface MainTargetViewController () <BaseVCDelegate>

@property (strong, nonatomic) IBOutlet UITextField *m_textField;
@property (strong, nonatomic) IBOutlet UIButton *confirm_btn;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle_label;

@end

@implementation MainTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"首頁設定" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.m_textField resignFirstResponder];
}

#pragma mark - init  *******
-(void)initWithUIObjects{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    
    //self.mainTitle_label
    self.mainTitle_label.adjustsFontSizeToFitWidth = YES;
    
    //self.m_textField
    [self.m_textField addTarget:self action:@selector(checkTextLength:) forControlEvents:UIControlEventEditingChanged];
    
    //self.confirm_btn
    [self.confirm_btn addTarget:self action:@selector(confirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Private Function  *********
-(void)checkTextLength:(UITextField *)textField{
    if(textField.text.length > 20){
        textField.text = [textField.text substringWithRange:NSMakeRange(0, 20)];
    }
}

-(void)confirmBtnAction{
    
    if(self.m_textField.text.length == 0 || [self.m_textField.text isEqualToString:@""]){
        [self showAlert:@"請輸入內容" message:@""];
        return;
    }
    
    [self saveNSUserDefaults:self.m_textField.text Key:Setting_Target];
    [self deleteNSUserDefaults:Setting_Time_Target];
    [self  gotoMainPageVC];
}

-(void)showAlert:(NSString *)title message:(NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirm];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)gotoMainPageVC{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}
@end
