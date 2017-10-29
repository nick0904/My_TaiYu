//
//  MainSettingViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/4.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "MainSettingViewController.h"
#import <Photos/Photos.h>

@interface MainSettingViewController () <BaseVCDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btn_target;
@property (strong, nonatomic) IBOutlet UIButton *btn_timeSetting;
@property (strong, nonatomic) IBOutlet UIButton *btn_photo;
@property (strong, nonatomic) IBOutlet UIButton *btn_company;
@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle_label;
@end

@implementation MainSettingViewController

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


#pragma mark - init *****
-(void)initWithUIObjects{
    
    // self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    //self.mainTitle_label
    self.mainTitle_label.adjustsFontSizeToFitWidth = YES;
    
    
    //self.btn_target
    [self.btn_target addTarget:self action:@selector(gotoTargetVC) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_timeSetting
    [self.btn_timeSetting addTarget:self action:@selector(gotoMainTimeVC) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_photo
    [self.btn_photo addTarget:self action:@selector(chooseImage) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_company
    [self.btn_company addTarget:self action:@selector(gotoCompanyVC) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - btn Action ******
-(void)gotoTargetVC{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainTargetVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)gotoMainTimeVC{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainTimeVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)chooseImage{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"請選擇示意圖來源" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *camra = [UIAlertAction actionWithTitle:@"相機" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self takePhotoByEvent:YES];
    }];
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相簿" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self takePhotoByEvent:NO];
    }];
    
    UIAlertAction *origin = [UIAlertAction actionWithTitle:@"還原預設圖" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImage *image = [UIImage imageNamed:@"title_image"];
        NSData *imgData = UIImagePNGRepresentation(image);
        [self saveNSUserDefaults:imgData Key:Setting_MainImage];
        [self gotoMainPageVC];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    
    [alert addAction:camra];
    [alert addAction:photo];
    [alert addAction:origin];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)gotoCompanyVC{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainCompanyVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)gotoMainPageVC{
    
    [self deleteNSUserDefaults:Setting_Target];
    [self deleteNSUserDefaults:Setting_Time_Target];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}

#pragma 呼叫相機 / 相簿事件
-(void)takePhotoByEvent:(BOOL)isCamara{
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    if(isCamara){
        //檢查是否支援此Source Type(相機)
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            
            //設定影像來源為相機
            imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            
            //顯示UIImagePickerController
            [self presentViewController: imagePickerController animated:YES completion:nil];
        }
    }
    else{
        //設定來源為相簿中挑選相片
        imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        
        //顯示UIImagePickerController
        [self presentViewController: imagePickerController animated:YES completion:nil];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    //取得剛拍攝的相片(或是由相簿中所選擇的相片)
    UIImage *image = [info objectForKey: UIImagePickerControllerEditedImage];
    NSData *imgData = UIImagePNGRepresentation(image);
    [self saveNSUserDefaults:imgData Key:Setting_MainImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{
       
        [self gotoMainPageVC];
    }];

}

@end
