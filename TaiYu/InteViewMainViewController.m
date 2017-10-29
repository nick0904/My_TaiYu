//
//  InteViewMainViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/4.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "InteViewMainViewController.h"
#import <SafariServices/SafariServices.h>
#import <Photos/Photos.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface InteViewMainViewController () <BaseVCDelegate,SFSafariViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@property (strong, nonatomic) IBOutlet UITextView *m_txtView;

@property (strong, nonatomic) IBOutlet UIButton *btn_video1;
@property (strong, nonatomic) IBOutlet UIButton *btn_video2;
@property (strong, nonatomic) IBOutlet UIButton *btn_record;
@property (strong, nonatomic) IBOutlet UIView *markView;


@end

@implementation InteViewMainViewController{
    
    SFSafariViewController *safariVC;
    UIImagePickerController *m_picker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"錄製影音履歷" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.m_txtView.contentOffset = CGPointMake(0, 0);
}

-(void)backAction{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *MainPageNav = [storyboard instantiateViewControllerWithIdentifier:@"MainPageNav"];
    [self.appdelegate.window setRootViewController:MainPageNav];
    [self.appdelegate.window makeKeyWindow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - init  *********
-(void)initWithUIObjects{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    //self.btn_video1
    [self.btn_video1 addTarget:self action:@selector(seeVideoAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_video2
    [self.btn_video2 addTarget:self action:@selector(seeVideoAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //self.btn_record
    [self.btn_record addTarget:self action:@selector(callCamera) forControlEvents:UIControlEventTouchUpInside];
    
    
}




#pragma amrk - Private Function  ********
-(void)seeVideoAction:(UIButton *)btn{
    
    if(![CheckNetwork isExistenceNetwork]){
        [self showNetworkAlert];
        return;
    }
    if(btn == self.btn_video1){
        [self openSafariVC:@"https://www.youtube.com/watch?v=Saog2-1uRNE"];
    }
    else{
        [self openSafariVC:@"https://www.youtube.com/watch?v=xUMorQ3CGo0"];
    }
}

-(void)openSafariVC:(NSString *)urlPath{
    
    safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlPath] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
}

-(void)gotoResumeVideoVC{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"InterView" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@""];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - call camera
-(void)callCamera{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        m_picker = [[UIImagePickerController alloc] init];
        m_picker.delegate = self;
        m_picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        m_picker.videoMaximumDuration = 180.0;
        m_picker.mediaTypes = @[(NSString *)kUTTypeMovie];
        m_picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        
        [self presentViewController:m_picker animated:YES completion:^{
           
            [m_picker startVideoCapture];
        }];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
    [PHPhotoLibrary.sharedPhotoLibrary performChanges:^{
        
         [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [picker dismissViewControllerAnimated:YES completion:nil];
        });
 
    }];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
