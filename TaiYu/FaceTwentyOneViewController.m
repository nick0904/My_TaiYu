//
//  FaceTwentyOneViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/15.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "FaceTwentyOneViewController.h"
#import "FaceInsideViewController.h"

@interface FaceTwentyOneViewController () <BaseVCDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btn_mechanical;
@property (strong, nonatomic) IBOutlet UIButton *btn_PowerMachinery;
@property (strong, nonatomic) IBOutlet UIButton *btn_MotorAndElectronics;
@property (strong, nonatomic) IBOutlet UIButton *btn_MotorAndCapitalclass;
@property (strong, nonatomic) IBOutlet UIButton *btn_Chemicalindustry;
@property (strong, nonatomic) IBOutlet UIButton *btn_CivilAndArchitecture;
@property (strong, nonatomic) IBOutlet UIButton *btn_Desing;
@property (strong, nonatomic) IBOutlet UIButton *btn_EngineeringAndManagement;
@property (strong, nonatomic) IBOutlet UIButton *btn_BusinessAndManagement;
@property (strong, nonatomic) IBOutlet UIButton *btn_HealthAndCare;
@property (strong, nonatomic) IBOutlet UIButton *btn_Food;
@property (strong, nonatomic) IBOutlet UIButton *btn_HomeCareGroup;
@property (strong, nonatomic) IBOutlet UIButton *btn_LifeApplication;
@property (strong, nonatomic) IBOutlet UIButton *btn_Farming;
@property (strong, nonatomic) IBOutlet UIButton *btn_English;
@property (strong, nonatomic) IBOutlet UIButton *btn_Japanese;
@property (strong, nonatomic) IBOutlet UIButton *btn_Brigade;
@property (strong, nonatomic) IBOutlet UIButton *btn_Maritime;
@property (strong, nonatomic) IBOutlet UIButton *btn_AquaticProducts;
@property (strong, nonatomic) IBOutlet UIButton *btn_Art;
@property (strong, nonatomic) IBOutlet UIButton *btn_InformationMmanagement;

@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@end

@implementation FaceTwentyOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    [self initWithNavigationBar:@"學群面對面" hiddenBackBtn:NO];
    
    [self initWithUIObjs];
    
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init  *******
-(void)initWithUIObjs{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    
    [self customBtn:self.btn_mechanical title:Face_21_mechanical];
    
    [self customBtn:self.btn_PowerMachinery title:Face_21_PowerMachinery];
    
    [self customBtn:self.btn_MotorAndElectronics title:Face_21_MotorAndElectronics];
    
    [self customBtn:self.btn_MotorAndCapitalclass title:Face_21_MotorAndCapitalclass];
    
    [self customBtn:self.btn_Chemicalindustry title:Face_21_Chemicalindustry];
    
    [self customBtn:self.btn_CivilAndArchitecture title:Face_21_CivilAndArchitecture];
    
    [self customBtn:self.btn_Desing title:Face_21_Desing];
    
    [self customBtn:self.btn_EngineeringAndManagement title:Face_21_EngineeringAndManagement];
    
    [self customBtn:self.btn_BusinessAndManagement title:Face_21_BusinessAndManagement];
    
    [self customBtn:self.btn_HealthAndCare title:Face_21_HealthAndCare];
    
    [self customBtn:self.btn_Food title:Face_21_Food];
    
    [self customBtn:self.btn_HomeCareGroup title:Face_21_HomeCareGroup];
    
    [self customBtn:self.btn_LifeApplication title:Face_21_LifeApplication];
    
    [self customBtn:self.btn_Farming title:Face_21_Farming];
    
    [self customBtn:self.btn_English title:Face_21_English];
    
    [self customBtn:self.btn_Japanese title:Face_21_Japanese];
    
    [self customBtn:self.btn_Brigade title:Face_21_Brigade];
    
    [self customBtn:self.btn_Maritime title:Face_21_Maritime];
    
    [self customBtn:self.btn_AquaticProducts title:Face_21_AquaticProducts];
    
    [self customBtn:self.btn_Art title:Face_21_Art];
    
    [self customBtn:self.btn_InformationMmanagement title:Face_21_InformationMmanagement];
    
}


#pragma mark - Private Function  *******
-(void)customBtn:(UIButton *)btn title:(NSString *)title {
    
    //[btn setTitle:title forState:UIControlStateNormal];
    //btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoFaceInsideViewController:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)gotoFaceInsideViewController:(UIButton *)btn{
    
    NSString *titleStr;
    
    if(btn == self.btn_mechanical){
        titleStr = Face_21_mechanical;
    }
    if (btn == self.btn_PowerMachinery) {
        titleStr = Face_21_PowerMachinery;
    }
    if(btn == self.btn_MotorAndElectronics){
        titleStr = Face_21_MotorAndElectronics;
    }
    if(btn == self.btn_MotorAndCapitalclass){
        titleStr = Face_21_MotorAndCapitalclass;
    }
    if(btn == self.btn_Chemicalindustry){
        titleStr = Face_21_Chemicalindustry;
    }
    if(btn == self.btn_CivilAndArchitecture){
        titleStr = Face_21_CivilAndArchitecture;
    }
    if(btn == self.btn_Desing){
        titleStr = Face_21_Desing;
    }
    if (btn == self.btn_EngineeringAndManagement) {
        titleStr = Face_21_EngineeringAndManagement;
    }
    if(btn == self.btn_BusinessAndManagement){
        titleStr = Face_21_BusinessAndManagement;
    }
    if(btn == self.btn_HealthAndCare){
        titleStr = Face_21_HealthAndCare;
    }
    if(btn == self.btn_Food){
        titleStr = Face_21_Food;
    }
    if(btn == self.btn_HomeCareGroup){
        titleStr = Face_21_HomeCareGroup;
    }
    if(btn == self.btn_LifeApplication){
        titleStr = Face_21_LifeApplication;
    }
    if(btn == self.btn_Farming){
        titleStr = Face_21_Farming;
    }
    if(btn == self.btn_English){
        titleStr = Face_21_English;
    }
    if(btn == self.btn_Japanese){
        titleStr = Face_21_Japanese;
    }
    if (btn == self.btn_Brigade) {
        titleStr = Face_21_Brigade;
    }
    if(btn == self.btn_Maritime){
        titleStr = Face_21_Maritime;
    }
    if(btn == self.btn_AquaticProducts){
        titleStr = Face_21_AquaticProducts;
    }
    if (btn == self.btn_Art) {
        titleStr = Face_21_Art;
    }
    if (btn == self.btn_InformationMmanagement) {
        titleStr = Face_21_InformationMmanagement;
    }

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Face" bundle:nil];
    FaceInsideViewController *FaceInsideVC = [storyboard instantiateViewControllerWithIdentifier:@"FaceInsideVC"];
    FaceInsideVC.theTitle = titleStr;
    [self.navigationController pushViewController:FaceInsideVC animated:YES];

}
@end
