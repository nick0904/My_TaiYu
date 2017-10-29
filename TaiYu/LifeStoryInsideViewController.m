//
//  LifeStoryInsideViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "LifeStoryInsideViewController.h"
#import <SafariServices/SafariServices.h>

@interface LifeStoryInsideViewController () <BaseVCDelegate,UITableViewDelegate,UITableViewDataSource,SFSafariViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *allBaseView;
    
@property (strong, nonatomic) IBOutlet UITableView *m_tableView;

@end

@implementation LifeStoryInsideViewController{
    
    NSMutableArray *ary_data;
    SFSafariViewController *safariVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"生涯故事" hiddenBackBtn:NO];
    [self initWithUIObjs];
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

#pragma mark - init  *******************
-(void)initWithUIObjs{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    self.m_tableView.dataSource = self;
    self.m_tableView.delegate = self;
}

    
#pragma mark - Tableiew DataSource & Delegate  ***************
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
    
    NSString *cell_id = @"LifeStoryInside_Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //main title
    UILabel *main_title = [cell.contentView viewWithTag:11];
    main_title.text = [ary_data[indexPath.section][indexPath.row] objectForKey:@"mainTitle"];
    main_title.numberOfLines = 0;
    
    //sub title
    UILabel *sub_title = [cell.contentView viewWithTag:22];
    sub_title.text = [ary_data[indexPath.section][indexPath.row] objectForKey:@"subTitle"];
    sub_title.numberOfLines = 0;
    sub_title.font = [UIFont systemFontOfSize:13];
    
    //btn
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
    
    if(self.lifeStory_type == EnumLifeStory_0){
        
        jsonPath = [[NSBundle mainBundle] pathForResource:@"LifeStoryDiscovery" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"LifeStoryDiscovery"];
    }
    else if (self.lifeStory_type == EnumLifeStory_1){
        
        jsonPath = [[NSBundle mainBundle] pathForResource:@"LifeStoryCelebrity" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"LifeStoryCelebrity"];
    }
    else if (self.lifeStory_type == EnumLifeStory_2){
        
        jsonPath = [[NSBundle mainBundle] pathForResource:@"LifeStoryStory" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"LifeStoryStory"];
    }
    else{
        
        jsonPath = [[NSBundle mainBundle] pathForResource:@"LifeStoryDreams" ofType:@"json"];
        ary_data = [[self parseJson:jsonPath] objectForKey:@"LifeStoryDreams"];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.m_tableView reloadData];
    });
}
    
-(NSMutableDictionary *)parseJson:(NSString *)jsonPath{
    
    NSData * data = [NSData dataWithContentsOfFile:jsonPath];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dic;
}

-(NSArray<NSString *>*)returnTitle{
    
    NSMutableArray<NSString *> *ary_title = [[NSMutableArray alloc] init];
    
    if(self.lifeStory_type == EnumLifeStory_0){
        [ary_title addObject:@"自我探索好文"];
    }
    else if (self.lifeStory_type == EnumLifeStory_1){
        [ary_title addObject:@"名人生涯"];
    }
    else if (self.lifeStory_type == EnumLifeStory_2){
        [ary_title addObject:@"轉折與應變"];
        [ary_title addObject:@"決策行動"];
        [ary_title addObject:@"生命故事"];
    }
    else{
        [ary_title addObject:@"商業與經濟"];
        [ary_title addObject:@"自然與科學"];
        [ary_title addObject:@"醫學與保健"];
        [ary_title addObject:@"技術與工程"];
        [ary_title addObject:@"行政與司法"];
        [ary_title addObject:@"教育與福利"];
        [ary_title addObject:@"電腦與通訊"];
        [ary_title addObject:@"傳播與文史"];
        [ary_title addObject:@"藝術與娛樂"];
        [ary_title addObject:@"飲食與旅遊"];
        [ary_title addObject:@"運動與生活"];
        [ary_title addObject:@"時尚與美容"];
    }
    
    return ary_title;
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
