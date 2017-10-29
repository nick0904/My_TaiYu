//
//  FaceInsideViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "FaceInsideViewController.h"
#import <SafariServices/SafariServices.h>

@interface FaceInsideViewController () <BaseVCDelegate,UITableViewDelegate,UITableViewDataSource,SFSafariViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *m_tableView;
@property (strong, nonatomic) IBOutlet UIView *noData_view;

@end

@implementation FaceInsideViewController{
    
    NSMutableArray *ary_data;
    
    SFSafariViewController *safariVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithUIObjects];
    [self parseJsonData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self initWithNavigationBar:self.theTitle hiddenBackBtn:NO];
    
    self.noData_view.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - init  *******
-(void)initWithUIObjects{
    
    self.m_tableView.delegate = self;
    self.m_tableView.dataSource = self;
}


-(void)parseJsonData{
    
    if(ary_data.count > 0){
        [ary_data removeAllObjects];
        ary_data = nil;
    }
    if(ary_data == nil){
        ary_data = [[NSMutableArray alloc]init];
    }
    
    NSString *jsonPath;
    
    
    ///18學群 ========================
    if([self.theTitle isEqualToString:@"資訊"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceInformation" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Information"];
    }
    if([self.theTitle isEqualToString:@"工程"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceEngineer" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Engineer"];
    }
    if([self.theTitle isEqualToString:@"財經"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceFinance" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Finance"];
    }
    if([self.theTitle isEqualToString:@"大眾傳播"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceMassMedia" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"MassMedia"];
    }
    if([self.theTitle isEqualToString:@"管理"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceManagement" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Management"];
    }
    if([self.theTitle isEqualToString:@"地球與環境"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceEarth" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Earth"];
    }
    if([self.theTitle isEqualToString:@"藝術"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceArt" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Art"];
    }
    if([self.theTitle isEqualToString:@"外語"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceLanguage" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Language"];
    }
    if([self.theTitle isEqualToString:@"文史哲學"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FacePhilosophy" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"philosophy"];
    }
    if([self.theTitle isEqualToString:@"生命科學"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceLifeSciences" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"LifeSciences"];
    }
    if([self.theTitle isEqualToString:@"教育"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceEducation" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Education"];
    }
    if([self.theTitle isEqualToString:@"社會與心理"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FacePsychology" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Psychology"];
    }
    if([self.theTitle isEqualToString:@"建築與設計"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceArchitecture" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Architecture"];
    }
    if([self.theTitle isEqualToString:@"遊憩與運動"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceSport" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Sport"];
    }
    if([self.theTitle isEqualToString:@"數理化學"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceMathematical" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Mathematical"];
    }
    if([self.theTitle isEqualToString:@"醫藥衛生"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceMedicine" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Medicine"];
    }
    if([self.theTitle isEqualToString:@"法律政治"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceLaw" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Law"];
    }
    if([self.theTitle isEqualToString:@"農林漁牧"]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"FaceFishing" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Fishing"];
    }
    
    
    ///21學群 ========================
    if([self.theTitle isEqualToString:Face_21_mechanical]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Mechanical" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Mechanical"];
    }
    if([self.theTitle isEqualToString:Face_21_PowerMachinery]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21PowerMachinery" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"PowerMachinery"];
    }
    if([self.theTitle isEqualToString:Face_21_MotorAndElectronics]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21MotorAndElectronics" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"MotorAndElectronics"];
    }
    if([self.theTitle isEqualToString:Face_21_MotorAndCapitalclass]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21MotorAndCapitalclass" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"MotorAndCapitalclass"];
    }
    if([self.theTitle isEqualToString:Face_21_Chemicalindustry]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Chemicalindustry" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Chemicalindustry"];
    }
    if([self.theTitle isEqualToString:Face_21_CivilAndArchitecture]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21CivilAndArchitecture" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"CivilAndArchitecture"];
    }
    if([self.theTitle isEqualToString:Face_21_Desing]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Desing" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Desing"];
    }
    if([self.theTitle isEqualToString:Face_21_EngineeringAndManagement]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21EngineeringAndManagement" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"EngineeringAndManagement"];
    }
    if([self.theTitle isEqualToString:Face_21_BusinessAndManagement]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21BusinessAndManagement" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"BusinessAndManagement"];
    }
    if([self.theTitle isEqualToString:Face_21_HealthAndCare]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21HealthAndCare" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"HealthAndCare"];
    }
    if([self.theTitle isEqualToString:Face_21_Food]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Food" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Food"];
    }
    if([self.theTitle isEqualToString:Face_21_HomeCareGroup]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21HomeCareGroup" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"HomeCareGroup"];
    }
    if([self.theTitle isEqualToString:Face_21_LifeApplication]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21LifeApplication" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"LifeApplication"];
    }
    if([self.theTitle isEqualToString:Face_21_Farming]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Farming" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Farming"];
    }
    if([self.theTitle isEqualToString:Face_21_English]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21English" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"English"];
    }
    if([self.theTitle isEqualToString:Face_21_Japanese]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Japanese" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Japanese"];
    }
    if([self.theTitle isEqualToString:Face_21_Brigade]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Brigade" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Brigade"];
    }
    if([self.theTitle isEqualToString:Face_21_Maritime]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Maritime" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Maritime"];
    }
    if([self.theTitle isEqualToString:Face_21_AquaticProducts]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21AquaticProducts" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"AquaticProducts"];
    }
    if([self.theTitle isEqualToString:Face_21_Art]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21Art" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"Art"];
    }
    if([self.theTitle isEqualToString:Face_21_InformationMmanagement]){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"Face21InformationMmanagement" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"InformationMmanagement"];
    }
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.m_tableView reloadData];
    });
}




#pragma mark - TableView Delegate & DataSource  ******
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(ary_data.count == 0){
        self.noData_view.hidden = NO;
    }
    
    return ary_data.count;
}

-(UITableViewCell *)
tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cell_id = @"FaceInsideCell_id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //mainTitle
    UILabel *mainTitle = [cell.contentView viewWithTag:11];
    mainTitle.numberOfLines = 0;
    mainTitle.text = [ary_data[indexPath.row] objectForKey:@"department"];
    mainTitle.textColor = [UIColor blackColor];

    
    //subTitle
    UILabel *subtitle = [cell.contentView viewWithTag:22];
    subtitle.numberOfLines = 0;
    subtitle.text = [ary_data[indexPath.row] objectForKey:@"people"];
    subtitle.textColor = [UIColor blackColor];
    
    UIButton *goBtn = [cell.contentView viewWithTag:33];
    goBtn.userInteractionEnabled = NO;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(![CheckNetwork isExistenceNetwork]){
        [self showNetworkAlert];
        return;
    }
    
//    NSString *firstStr = [NSString stringWithFormat:@"%@",[ary_data[indexPath.row] objectForKey:@"department"]];
//    NSString *secondStr = [NSString stringWithFormat:@" %@",[ary_data[indexPath.row] objectForKey:@"people"]];
//    NSString *nessageStr = [firstStr stringByAppendingString:secondStr];
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"前往" message:nessageStr preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        [self openSafariVC:[ary_data[indexPath.row] objectForKey:@"URL"]];
//    }];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
//    [alert addAction:confirmAction];
//    [alert addAction:cancelAction];
//    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    [self openSafariVC:[ary_data[indexPath.row] objectForKey:@"URL"]];
}


-(void)openSafariVC:(NSString *)urlPath{
    
    safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlPath] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
}


@end
