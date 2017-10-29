//
//  AllTwiwanViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/8.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "AllTwiwanViewController.h"
#import <SafariServices/SafariServices.h>

@interface AllTwiwanViewController () <BaseVCDelegate,UITableViewDelegate,UITableViewDataSource,SFSafariViewControllerDelegate,UITextFieldDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btn_Pingtung;
@property (strong, nonatomic) IBOutlet UIButton *btn_Kaohsiung;
@property (strong, nonatomic) IBOutlet UIButton *btn_Tainan;
@property (strong, nonatomic) IBOutlet UIButton *btn_Chiayi_City;
@property (strong, nonatomic) IBOutlet UIButton *btn_Chiayi_Country;
@property (strong, nonatomic) IBOutlet UIButton *btn_Yunlin;
@property (strong, nonatomic) IBOutlet UIButton *btn_Nantou;
@property (strong, nonatomic) IBOutlet UIButton *btn_Changhua;
@property (strong, nonatomic) IBOutlet UIButton *btn_Taichung;
@property (strong, nonatomic) IBOutlet UIButton *btn_Miaoli;
@property (strong, nonatomic) IBOutlet UIButton *btn_Hsinchu_City;
@property (strong, nonatomic) IBOutlet UIButton *btn_Hsinchu_Country;
@property (strong, nonatomic) IBOutlet UIButton *btn_Taoyuan;
@property (strong, nonatomic) IBOutlet UIButton *btn_NewTaipei;
@property (strong, nonatomic) IBOutlet UIButton *btn_Taipei;
@property (strong, nonatomic) IBOutlet UIButton *btn_Keelung;
@property (strong, nonatomic) IBOutlet UIButton *btn_Yilan;
@property (strong, nonatomic) IBOutlet UIButton *btn_Hualien;
@property (strong, nonatomic) IBOutlet UIButton *btn_Taitung;
@property (strong, nonatomic) IBOutlet UIButton *btn_Penghu;
@property (strong, nonatomic) IBOutlet UIButton *btn_kinmen;

//--------
@property (strong, nonatomic) IBOutlet UIButton *search_btn;

@property (strong, nonatomic) IBOutlet UITextField *search_textField;

@property (strong, nonatomic) IBOutlet UIScrollView *m_scrollView;

@property (strong, nonatomic) IBOutlet UIView *taiwan_View;

//--------
@property (strong, nonatomic) IBOutlet UIView *search_baseView;

@property (strong, nonatomic) IBOutlet UITableView *search_tableView;

//--------
@property (strong, nonatomic) IBOutlet UIView *city_baseView;
@property (strong, nonatomic) IBOutlet UITableView *city_tableView;
//--------
@property (strong, nonatomic) IBOutlet UIView *info_baseView;
@property (strong, nonatomic) IBOutlet UILabel *info_title;
@property (strong, nonatomic) IBOutlet UILabel *info_detail;
@property (strong, nonatomic) IBOutlet UIButton *info_webBtn;


@end

@implementation AllTwiwanViewController{
    
    NSMutableArray *ary_area;
    NSMutableArray *ary_keyword;
    BOOL isCityBtnActivity;
    NSString *cityName;
    NSString *info_url;
    SFSafariViewController *safariVC;

    //手勢
    UITapGestureRecognizer *tapGesture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self initWithNavigationBar:@"全臺大專院校" hiddenBackBtn:NO];
    [self initWithUIObjs];
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

-(void)initWithUIObjs{
    
    [self customBtnAddAction:self.btn_Pingtung];
    [self customBtnAddAction:self.btn_Kaohsiung];
    [self customBtnAddAction:self.btn_Tainan];
    [self customBtnAddAction:self.btn_Chiayi_City];
    [self customBtnAddAction:self.btn_Chiayi_Country];
    [self customBtnAddAction:self.btn_Yunlin];
    [self customBtnAddAction:self.btn_Changhua];
    [self customBtnAddAction:self.btn_Taichung];
    [self customBtnAddAction:self.btn_Nantou];
    [self customBtnAddAction:self.btn_Miaoli];
    [self customBtnAddAction:self.btn_Hsinchu_City];
    [self customBtnAddAction:self.btn_Hsinchu_Country];
    [self customBtnAddAction:self.btn_Taoyuan];
    [self customBtnAddAction:self.btn_NewTaipei];
    [self customBtnAddAction:self.btn_Taipei];
    [self customBtnAddAction:self.btn_Keelung];
    [self customBtnAddAction:self.btn_Yilan];
    [self customBtnAddAction:self.btn_Hualien];
    [self customBtnAddAction:self.btn_Taitung];
    [self customBtnAddAction:self.btn_Penghu];
    [self customBtnAddAction:self.btn_kinmen];
    
    //
    self.search_baseView.hidden = YES;
    self.search_tableView.delegate = self;
    self.search_tableView.dataSource = self;
    self.search_baseView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.search_baseView.layer.shadowOffset = CGSizeMake(8.0, 8.0);
    self.search_baseView.layer.shadowOpacity = 0.8;
    
    //
    self.city_baseView.hidden = YES;
    self.city_baseView.backgroundColor = [UIColor whiteColor];
    self.city_tableView.delegate = self;
    self.city_tableView.dataSource = self;
    self.city_baseView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.city_baseView.layer.shadowOffset = CGSizeMake(8.0, 8.0);
    self.city_baseView.layer.shadowOpacity = 0.8;
    
    //
    self.info_baseView.hidden = YES;
    [self.info_webBtn addTarget:self action:@selector(infoWebBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.info_baseView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.info_baseView.layer.shadowOffset = CGSizeMake(8.0, 8.0);
    self.info_baseView.layer.shadowOpacity = 0.8;
    
    //
    [self.search_btn addTarget:self action:@selector(searchBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.search_textField.delegate = self;
    
    //
    [self addTapGestureOnScrollView];
    
    
    //
    self.m_scrollView.delegate = self;
    self.m_scrollView.maximumZoomScale = 3.0;
    self.m_scrollView.minimumZoomScale = 1.0;
    
    
    self.info_title.adjustsFontSizeToFitWidth = YES;
    self.info_detail.adjustsFontSizeToFitWidth = YES;
}

#pragma mark  - 手勢
-(void)addTapGestureOnScrollView{
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction)];
    [self.m_scrollView addGestureRecognizer:tapGesture];
}

#pragma mark - Private Function  ************
-(void)customBtnAddAction:(UIButton *)btn{
    
    [btn addTarget:self action:@selector(btnAddAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnAddAction:(UIButton *)btn{
    
    isCityBtnActivity = YES;
    
    if (btn == self.btn_Pingtung){
        [self parseJsonByArea:@"屏東縣"];
    }
    if (btn == self.btn_Kaohsiung){
        [self parseJsonByArea:@"高雄市"];
    }
    if (btn == self.btn_Tainan){
        [self parseJsonByArea:@"臺南市"];
    }
    if (btn == self.btn_Chiayi_City){
        [self parseJsonByArea:@"嘉義市"];
    }
    if(btn == self.btn_Chiayi_Country){
        [self parseJsonByArea:@"嘉義縣"];
    }
    if (btn == self.btn_Yunlin){
        [self parseJsonByArea:@"雲林縣"];
    }
    if (btn == self.btn_Changhua){
        [self parseJsonByArea:@"彰化縣"];
    }
    if (btn == self.btn_Taichung){
        [self parseJsonByArea:@"臺中市"];
    }
    if (btn == self.btn_Nantou){
        [self parseJsonByArea:@"南投縣"];
    }
    if (btn == self.btn_Miaoli){
        [self parseJsonByArea:@"苗栗縣"];
    }
    if (btn == self.btn_Hsinchu_City){
        [self parseJsonByArea:@"新竹市"];
    }
    if (btn == self.btn_Hsinchu_Country){
        [self parseJsonByArea:@"新竹縣"];
    }
    if (btn == self.btn_Taoyuan){
        [self parseJsonByArea:@"桃園市"];
    }
    if (btn == self.btn_NewTaipei){
        [self parseJsonByArea:@"新北市"];
    }
    if (btn == self.btn_Taipei){
        [self parseJsonByArea:@"臺北市"];
    }
    if (btn == self.btn_Keelung){
        [self parseJsonByArea:@"基隆市"];
    }
    if (btn == self.btn_Yilan){
        [self parseJsonByArea:@"宜蘭縣"];
    }
    if (btn == self.btn_Hualien){
        [self parseJsonByArea:@"花蓮縣"];
    }
    if (btn == self.btn_Taitung){
        [self parseJsonByArea:@"臺東縣"];
    }
    if (btn == self.btn_Penghu){
        [self parseJsonByArea:@"澎湖縣"];
    }
    if (btn == self.btn_kinmen){
        [self parseJsonByArea:@"金門縣"];
    }
    
    [self showCityOrSearch:isCityBtnActivity];
    [self.city_tableView reloadData];
}

//依縣市搜尋
-(void)parseJsonByArea:(NSString *)area{
    
    if(ary_area.count>0){
        [ary_area removeAllObjects];
        ary_area = nil;
    }
    if(ary_area == nil){
        ary_area = [[NSMutableArray alloc] init];
    }
    
    cityName = area;
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"AllTaiwanSchool" ofType:@"json"];
    
    NSArray *ary_temp = [[NSArray alloc] initWithArray:[[self parseJson:jsonPath] objectForKey:@"AllTaiwanSchool"]];
    
    for(int i = 0; i < ary_temp.count; i++){
        if([[ary_temp[i] objectForKey:@"area"] isEqualToString:area]){
            [ary_area addObject:ary_temp[i]];
        }
    }
    
    NSLog(@"ary_area:%@",ary_area);
}

//關鍵字搜尋
-(void)parseJsonByKeyword:(NSString *)keyword{
    
    if(ary_keyword.count>0){
        [ary_keyword removeAllObjects];
        ary_keyword = nil;
    }
    if(ary_keyword == nil){
        ary_keyword = [[NSMutableArray alloc] init];
    }
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"AllTaiwanSchool" ofType:@"json"];
    NSArray *ary_temp = [[NSArray alloc] initWithArray:[[self parseJson:jsonPath] objectForKey:@"AllTaiwanSchool"]];
    
    for(int i = 0; i < ary_temp.count; i++){
        NSString *schoolStr = (NSString *)[ary_temp[i] objectForKey:@"school"];
        NSString *instructionStr = (NSString *)[ary_temp[i] objectForKey:@"instruction"];
        if([schoolStr containsString:keyword] || [instructionStr containsString:keyword]){
            [ary_keyword addObject:ary_temp[i]];
        }
        
    }

}


//search Btn
-(void)searchBtnAction:(UIButton *)btn{
    
    [self.search_textField becomeFirstResponder];
}

-(void)showCityOrSearch:(BOOL)isCity{
    
    if(isCity){
        [self.search_textField resignFirstResponder];
        self.search_baseView.hidden = YES;
        self.city_baseView.hidden = NO;
    }
    else{
        //search
        [self.search_textField resignFirstResponder];
        self.search_baseView.hidden = NO;
        self.city_baseView.hidden = YES;
    }
}


-(void)infoWebBtnAction{
    
    if(![CheckNetwork isExistenceNetwork]){
        [self showNetworkAlert];
        return;
    }
    
    safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:info_url] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
}


//手勢 Action
-(void)tapGestureAction{
    
    if([self.info_baseView isHidden] == NO){
        self.info_baseView.hidden = YES;
        return;
    }
    
    if(isCityBtnActivity){
        
        self.city_baseView.hidden = YES;
    }
    else{
        self.search_textField.text = @"";
        self.search_baseView.hidden = YES;
    }
}



#pragma mark - TableView DataSource & Delegate  ***********
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(isCityBtnActivity){
        
        self.city_tableView.contentOffset = CGPointMake(0, 0);
        
        return self.city_tableView.frame.size.height/5;
    }
    else{
        return 0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *label;
    if(isCityBtnActivity){
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.city_tableView.frame.size.width, self.city_tableView.frame.size.height/5)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = cityName;
        label.backgroundColor = [UIColor whiteColor];
    }
    return label;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(isCityBtnActivity){
        return ary_area.count;
    }
    else{
        return ary_keyword.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cell_id = isCityBtnActivity == YES ? @"cityCell_id" : @"searchCell_id";
    
    if(isCityBtnActivity){
        
        tableView = self.city_tableView;
    }
    else{
        tableView = self.search_tableView;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(isCityBtnActivity){
        
        UILabel *title_label = [cell.contentView viewWithTag:11];
        title_label.text = [ary_area[indexPath.row] objectForKey:@"national"];

        UILabel *school_label = [cell.contentView viewWithTag:22];
        school_label.text = [ary_area[indexPath.row] objectForKey:@"school"];
    }
    else{
        
        UILabel *title_label = [cell.contentView viewWithTag:11];
        title_label.text = [ary_keyword[indexPath.row] objectForKey:@"national"];
        
        UILabel *school_label = [cell.contentView viewWithTag:22];
        school_label.text = [ary_keyword[indexPath.row] objectForKey:@"school"];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(isCityBtnActivity){
        
        self.info_title.text = [ary_area[indexPath.row] objectForKey:@"school"];
        self.info_detail.text = [ary_area[indexPath.row] objectForKey:@"instruction"];
        info_url = [ary_area[indexPath.row] objectForKey:@"URL"];
    }
    else{
        self.info_title.text = [ary_keyword[indexPath.row] objectForKey:@"school"];
        self.info_detail.text = [ary_keyword[indexPath.row] objectForKey:@"instruction"];
        info_url = [ary_keyword[indexPath.row] objectForKey:@"URL"];
    }
    
    self.info_baseView.hidden = NO;
}


#pragma mark - TextField Delegate  ***********
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    isCityBtnActivity = NO;
    
    [self.search_textField resignFirstResponder];
    
    [self parseJsonByKeyword:self.search_textField.text];
    
    [self showCityOrSearch:isCityBtnActivity];
    
    [self.search_tableView reloadData];
    
    return YES;
}

#pragma mark - ScrollView Delegate  ************
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.taiwan_View;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    
}


@end
