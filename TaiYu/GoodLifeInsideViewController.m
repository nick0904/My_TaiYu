//
//  GoodLifeInsideViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/8.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "GoodLifeInsideViewController.h"
#import <SafariServices/SafariServices.h>

@interface GoodLifeInsideViewController () <BaseVCDelegate,UITableViewDelegate,UITableViewDataSource,SFSafariViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *allBaseView;

@property (strong, nonatomic) IBOutlet UITableView *goodlife_tableView;

@end

@implementation GoodLifeInsideViewController{
    
    NSMutableArray *ary_data;
    SFSafariViewController *safariVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"生涯好站" hiddenBackBtn:NO];
    [self initWithUIObjects];
}

-(void)viewWillAppear:(BOOL)animated{
    [self parseJson];
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - init  *************
-(void)initWithUIObjects{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    self.goodlife_tableView.delegate = self;
    self.goodlife_tableView.dataSource = self;
}


#pragma mark - TableView Delegaete & DataSource  **********
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self returnTitle].count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *title_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/8)];
    title_label.backgroundColor = COLOR_TableView_Header;
    title_label.text = [self returnTitle][section];
    title_label.textColor = [UIColor whiteColor];
    title_label.textAlignment = NSTextAlignmentCenter;
    title_label.font = [UIFont systemFontOfSize:24];
    return title_label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.view.frame.size.height/8;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *ary_unit = [[NSArray alloc] initWithArray:ary_data[section]];
    
    return ary_unit.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    NSString *cell_id = @"GoodLifeInsideCell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //mainTitle
    UILabel *mainTitle = [cell.contentView viewWithTag:11];
    mainTitle.text = [ary_data[indexPath.section][indexPath.row] objectForKey:@"mainTitle"];
    mainTitle.numberOfLines = 0;
    mainTitle.adjustsFontSizeToFitWidth = YES;
    
    //subTitle
    UILabel *subTitle = [cell.contentView viewWithTag:22];
    subTitle.text = [ary_data[indexPath.section][indexPath.row] objectForKey:@"subTitle"];
    subTitle.numberOfLines = 0;
    subTitle.adjustsFontSizeToFitWidth = YES;
    subTitle.font = [UIFont systemFontOfSize:13];
    
    //gobtn
    UIButton *goBtn = [cell.contentView viewWithTag:33];
    goBtn.userInteractionEnabled = NO;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self openSafariVC:[ary_data[indexPath.section][indexPath.row] objectForKey:@"URL"]];
}


#pragma mark - parseJson  ********
-(void)parseJson{
    
    if(ary_data.count > 0){
        [ary_data removeAllObjects];
        ary_data = nil;
    }
    if(ary_data == nil){
        ary_data = [[NSMutableArray alloc]init];
    }
    
    NSString *jsonPath;
    
    if(self.m_type == EnumGoodLife_0){
        
        jsonPath = [[NSBundle mainBundle] pathForResource:@"GoodLifeInfo" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"GoodLifeInfo"];
    }
    if(self.m_type == EnumGoodLife_1){
        
        jsonPath = [[NSBundle mainBundle] pathForResource:@"GoodLifeDepartment" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"GoodLifeDepartment"];
    }
    if(self.m_type == EnumGoodLife_2){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"GoodLifeHR" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"GoodLifeHR"];
    }
    if(self.m_type == EnumGoodLife_3){
        jsonPath = [[NSBundle mainBundle] pathForResource:@"GoodLifeOthers" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"GoodLifeOthers"];
    }
    
    NSLog(@"ary_data >>>>> %@",ary_data);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.goodlife_tableView reloadData];
    });
}


-(NSMutableDictionary *)parseJson:(NSString *)jsonPath{
    
    NSData * data = [NSData dataWithContentsOfFile:jsonPath];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dic;
}


-(NSArray<NSString *>*)returnTitle{
    
    NSMutableArray<NSString *> *ary_title = [[NSMutableArray alloc] init];
   
    if(self.m_type == EnumGoodLife_0){
        [ary_title addObject:@"大學校院"];
        [ary_title addObject:@"技專校院"];
        [ary_title addObject:@"軍警校院"];
        return ary_title;
    }
    else if (self.m_type == EnumGoodLife_1){
        [ary_title addObject:@"大專校院科系探索"];
        [ary_title addObject:@"落點分析"];
        return ary_title;
    }
    else if (self.m_type == EnumGoodLife_2){
        [ary_title addObject:@"公家機關"];
        [ary_title addObject:@"證照及考試資訊"];
        [ary_title addObject:@"人力銀行"];
        return ary_title;
    }
    else{
        [ary_title addObject:@"留學資訊"];
        [ary_title addObject:@"趣味測驗"];
        [ary_title addObject:@"公家機關"];
        [ary_title addObject:@"探索與學習"];
        return ary_title;
    }
}

    
//開網頁
-(void)openSafariVC:(NSString *)urlPath{
    
    if(![CheckNetwork isExistenceNetwork]){
        [self showNetworkAlert];
        return;
    }
    
    safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlPath] entersReaderIfAvailable:YES];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
}

@end
