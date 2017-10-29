//
//  ResumeVideoViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/6.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "ResumeVideoViewController.h"
#import <Photos/Photos.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ResumeVideoViewController () <BaseVCDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ResumeVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"ResumeVideoVC" hiddenBackBtn:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self callCamera];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - call camera
-(void)callCamera{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.videoMaximumDuration = 3.0;
        picker.mediaTypes = @[(NSString *)kUTTypeMovie];
        
        [self presentViewController:picker animated:YES completion:nil];
    }

}



@end
