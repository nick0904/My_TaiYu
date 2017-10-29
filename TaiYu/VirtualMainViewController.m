//
//  VirtualMainViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/4.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "VirtualMainViewController.h"
#import <Photos/Photos.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface VirtualMainViewController () <BaseVCDelegate,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@property (strong, nonatomic) IBOutlet UIView *choose_baseView;

@property (strong, nonatomic) IBOutlet UIView *title_baseView;

@property (strong, nonatomic) IBOutlet UILabel *choose_titleLabel;

@property (strong, nonatomic) IBOutlet UITableView *m_tableView;

@property (strong, nonatomic) IBOutlet UIButton *btn_interViewType;
@property (strong, nonatomic) IBOutlet UIButton *btn_interViewCount;
@property (strong, nonatomic) IBOutlet UIButton *btn_moniterType;

///For record
@property (strong, nonatomic) IBOutlet UIImageView *man_imgView;
@property (strong, nonatomic) IBOutlet UILabel *video_title;
@property (strong, nonatomic) IBOutlet UIButton *video_nextBtn;
@property (strong, nonatomic) IBOutlet UIView *video_baseView;
@property (strong, nonatomic) IBOutlet UILabel *mainLabel;

@end

typedef enum{
    type01,//面試類型
    type02,//面試題數
    type03 //螢幕顯示
}ChooseType;

@implementation VirtualMainViewController {
    
    NSMutableArray *ary_Mark01;
    NSMutableArray *ary_Mark02;
    NSMutableArray *ary_Mark03;
    
    NSArray *ary_type01;
    NSArray *ary_type02;
    NSArray *ary_type03;
    
    NSMutableArray *ary_interView;
    NSMutableArray *ary_final;
    
    ChooseType chooseType;
    
    UIImagePickerController *m_picker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"虛擬面試台" hiddenBackBtn:NO];
    [self initWithParameter];
    [self initWitUIObject];
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

#pragma mark - init  **********
-(void)initWithParameter{
    
    ary_type01 = [[NSArray alloc] initWithObjects:@"升學面試",@"就業面試", nil];
    ary_type02 = [[NSArray alloc] initWithObjects:@"5",@"8",@"10", nil];
    ary_type03 = [[NSArray alloc] initWithObjects:@"我的儀態",@"虛擬面試官", nil];

}

-(void)initWitUIObject{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    self.mainLabel.adjustsFontSizeToFitWidth = YES;
    
    self.choose_baseView.hidden = YES;
    self.m_tableView.hidden = YES;
    self.title_baseView.hidden = YES;
    self.m_tableView.delegate = self;
    self.m_tableView.dataSource = self;
    self.m_tableView.separatorColor = [UIColor clearColor];
    self.m_tableView.scrollEnabled = NO;//禁止滾動
    
    self.man_imgView.hidden = YES;
    self.video_title.hidden = YES;
    self.video_baseView.hidden = YES;
    self.video_nextBtn.hidden = YES;
}


#pragma mark - Btn Function  ********
//type02
- (IBAction)itemCountAction:(id)sender {
    
    chooseType = type02;
    self.choose_baseView.hidden = NO;
    self.title_baseView.hidden = NO;
    self.m_tableView.hidden = NO;
    
    if(ary_Mark02 == nil){
        ary_Mark02 = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0", nil];
    }
    
    [self.m_tableView reloadData];
}

//type03
- (IBAction)moniterAction:(id)sender {
    
    chooseType = type03;
    self.choose_baseView.hidden = NO;
    self.m_tableView.hidden = NO;
    self.title_baseView.hidden = NO;
    
    if(ary_Mark03 == nil){
        ary_Mark03 = [[NSMutableArray alloc] initWithObjects:@"0",@"0", nil];
    }
    
    [self.m_tableView reloadData];
}

//type01
- (IBAction)interViewTypeAction:(id)sender {
    
    chooseType = type01;
    self.choose_baseView.hidden = NO;
    self.m_tableView.hidden = NO;
    self.title_baseView.hidden = NO;

    if(ary_Mark01 == nil){
        ary_Mark01 = [[NSMutableArray alloc] initWithObjects:@"0",@"0", nil];
    }
    
    [self.m_tableView reloadData];
}

- (IBAction)startRecord:(id)sender {
    
    [self checkAllItemValue];
    [self checkInterViewType ];
}


#pragma mark - TableView Delegate & DataSource  **********
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(chooseType == type01){
        self.choose_titleLabel.text = @"面試類型";
        return ary_type01.count;
    }
    else if (chooseType == type02){
        self.choose_titleLabel.text = @"面試題數";
        return ary_type02.count;
    }
    else{
        self.choose_titleLabel.text = @"螢幕顯示";
        return ary_type03.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cell_id = @"chooseTypeCell_id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(chooseType == type01){
        
        UILabel *label = [cell.contentView viewWithTag:22];
        label.text = ary_type01[indexPath.row];
        
        UIImageView *imgView = [cell.contentView viewWithTag:11];
        imgView.image = [self checkMark:(NSString *)ary_Mark01[indexPath.row]];
        imgView.frame = [self fixIconFrame:imgView.center iconWidth:imgView.frame.size.width];
        
    }
    else if (chooseType == type02){
        
        UILabel *label = [cell.contentView viewWithTag:22];
        label.text = ary_type02[indexPath.row];

        UIImageView *imgView = [cell.contentView viewWithTag:11];
        imgView.image = [self checkMark:(NSString *)ary_Mark02[indexPath.row]];
        imgView.frame = [self fixIconFrame:imgView.center iconWidth:imgView.frame.size.width];


    }
    else{
        
        UILabel *label = [cell.contentView viewWithTag:22];
        label.text = ary_type03[indexPath.row];

        UIImageView *imgView = [cell.contentView viewWithTag:11];
        imgView.image = [self checkMark:(NSString *)ary_Mark03[indexPath.row]];
        imgView.frame = [self fixIconFrame:imgView.center iconWidth:imgView.frame.size.width];

    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(chooseType == type01){
        
        for (int i = 0; i < ary_Mark01.count; i++) {
            
            if(i == indexPath.row){
                ary_Mark01[i] = @"1";
                [self.btn_interViewType setTitle:ary_type01[i] forState:UIControlStateNormal];
            }
            else{
                ary_Mark01[i] = @"0";
            }
        }
        
    }
    else if(chooseType == type02){
        
        for (int i = 0; i < ary_Mark02.count; i++) {
            
            if(i == indexPath.row){
                ary_Mark02[i] = @"1";
                [self.btn_interViewCount setTitle:ary_type02[i] forState:UIControlStateNormal];
            }
            else{
                ary_Mark02[i] = @"0";
            }
        }
    }
    else{
        
        for (int i = 0; i < ary_Mark03.count; i++) {
            
            if(i == indexPath.row){
                ary_Mark03[i] = @"1";
                [self.btn_moniterType setTitle:ary_type03[i] forState:UIControlStateNormal];
            }
            else{
                ary_Mark03[i] = @"0";
            }
        }
        
    }
    
    
    self.choose_baseView.hidden = YES;
    self.m_tableView.hidden = YES;
    self.title_baseView.hidden = YES;
}


#pragma mark - Private Function  ********
-(UIImage *)checkMark:(NSString *)mark{
    
    if([mark isEqualToString:@"1"]){
        return [UIImage imageNamed:@"check_1"];
    }
    else{
         return [UIImage imageNamed:@"check_0"];
    }
}


//判斷是哪種 interView
-(void)checkInterViewType{
    
    if(ary_interView.count > 0){
        [ary_interView removeAllObjects];
        ary_interView = nil;
    }
    if(ary_interView == nil){
        ary_interView = [[NSMutableArray alloc] init];
    }
    
    int num = 0;
    for(int i = 0; i < ary_Mark01.count; i++){
        if([ary_Mark01[i] isEqualToString:@"1"]){
            num = i;
        }
    }

    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"VirtualInterView" ofType:@"json"];
    
    NSMutableArray *ary_tempInterView = [[NSMutableArray alloc] initWithArray:[[self parseJson:jsonPath] objectForKey:@"VirtualInterView"]];
    
    ary_interView = [ary_tempInterView[num] mutableCopy];
    
    [self checkItemCount];
}

-(void)checkItemCount{
    
    int num = 0;
    
    for(int i = 0; i < ary_Mark02.count; i++){
        
        if([ary_Mark02[i] isEqualToString:@"1"]){
            
            num = i;
        }
    }
    
    int theCount = 5;
    if(num == 0){
        theCount = 5;
    }
    else if (num == 1){
        theCount = 8;
    }
    else{
        theCount = 10;
    }

    [self getRandomAry:theCount];
}

-(void)getRandomAry:(int)theCount{
    
    NSMutableArray *ary_inter_temp = [[[NSMutableArray alloc] initWithArray:ary_interView] mutableCopy];
    
    if(ary_final.count > 0){
        [ary_final removeAllObjects];
        ary_final = nil;
    }
    
    if(ary_final == nil){
        ary_final = [[NSMutableArray alloc] init];
        [ary_final addObject:ary_interView[0]];//先將第一題加到陣列
    }
    
    [ary_inter_temp removeObjectAtIndex:0];
    [ary_inter_temp removeLastObject];
    
    theCount = theCount-2;
    
    NSMutableArray *ary_temp = [[NSMutableArray alloc] init];
    for (int i = 0; i < ary_inter_temp.count-1; i++){
        [ary_temp addObject:[NSNumber numberWithInt:i]];
    }
    
    int maxNum = (int)ary_temp.count - 1;
    
    for(int i = 0; i < theCount; i++){
        int value = (arc4random() % maxNum);
        [ary_final addObject:ary_inter_temp[[ary_temp[value] intValue]]];
        
        ary_temp[value] = ary_temp[maxNum];
        
        maxNum -= 1;
    }
    [ary_final addObject:ary_interView[ary_interView.count-1]];//最後將最後一題加到陣列
    NSLog(@"ary_final:::%@",ary_final);
    [ary_inter_temp removeAllObjects];
    ary_inter_temp = nil;
    
    [self saveNSUserDefaults:ary_final Key:Ary_VirtualItem];
    [self saveNSUserDefaults:[NSNumber numberWithInt:0] Key:VideoCount];
    
    [self callCamera];
}





#pragma mark - 判斷是否有項目未設定  *********
-(void)checkAllItemValue{
    
    int mark01 = 0;
    for(int i = 0; i < ary_Mark01.count; i++){
        if([ary_Mark01[i] isEqualToString:@"0"]){
            mark01 += 1;
        }
    }
    if(mark01 == ary_Mark01.count){
        [self showAlert:@"請選擇面試類型" message:nil];
        return;
    }
    
    //----------------------------------------------
    int mark02 = 0;
    for(int i = 0; i < ary_Mark02.count; i++){
        if([ary_Mark02[i] isEqualToString:@"0"]){
            mark02 += 1;
        }
    }
    if(mark02 == ary_Mark02.count){
        [self showAlert:@"請選擇面試題數" message:nil];
        return;
    }
    
    //----------------------------------------------
    int mark03 = 0;
    for(int i = 0; i < ary_Mark03.count; i++){
        if([ary_Mark03[i] isEqualToString:@"0"]){
            mark03 += 1;
        }

    }
    if(mark03 == ary_Mark03.count){
        [self showAlert:@"請選擇螢幕顯示" message:nil];
        return;
    }
    
}

-(void)showAlert:(NSString *)title message:(NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:confirmAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - call camera  ***********
-(void)callCamera{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        if(m_picker != nil){
            m_picker = nil;
        }
        
        m_picker = [[UIImagePickerController alloc] init];
        m_picker.delegate = self;
        m_picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        m_picker.mediaTypes = @[(NSString *)kUTTypeMovie];
        m_picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        if([self.btn_moniterType.titleLabel.text isEqualToString:@"虛擬面試官"]){
            self.man_imgView.hidden = NO;
            [m_picker.view addSubview:self.man_imgView];
        }
        
        self.video_title.hidden = NO;
        self.video_title.text = [ary_final[0] objectForKey:@"item"];
        [m_picker.view addSubview:self.video_title];
        
        self.video_nextBtn.hidden = NO;
        [m_picker.view addSubview:self.video_nextBtn];
        [self.video_nextBtn addTarget:self action:@selector(videoNextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.video_baseView.hidden = NO;
        [m_picker.view addSubview:self.video_baseView];

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

-(void)videoNextBtnAction:(UIButton *)btn{
    
    if([btn.titleLabel.text isEqualToString:@"結束錄影"]){
        [m_picker stopVideoCapture];
    }
    
    NSArray *ary = [[NSArray alloc] initWithArray:[self readNSUserDefaults:Ary_VirtualItem]];
    int num = [[self readNSUserDefaults:VideoCount] intValue];
    if(num < ary.count-1){
        num+=1;
        self.video_title.text = (NSString *)[ary[num] objectForKey:@"item"];
        [self saveNSUserDefaults:[NSNumber numberWithInt:num] Key:VideoCount];
    }
    
    if(num == ary.count-1){
        [btn setTitle:@"結束錄影" forState:UIControlStateNormal];
    }
   
}


@end
