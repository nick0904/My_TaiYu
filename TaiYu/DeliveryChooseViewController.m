//
//  DeliveryChooseViewController.m
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/3.
//  Copyright © 2017年 Nick. All rights reserved.
//

#import "DeliveryChooseViewController.h"
#import "DeliveryResultViewController.h"

@interface DeliveryChooseViewController () <BaseVCDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *allBaseView;
@property (strong, nonatomic) IBOutlet UILabel *question_label;
@property (strong, nonatomic) IBOutlet UIImageView *correct_imgView;
@property (strong, nonatomic) IBOutlet UIButton *answer_btn;
@property (strong, nonatomic) IBOutlet UITableView *choose_tableView;

@end

@implementation DeliveryChooseViewController{
    
    NSMutableArray *ary_data;
    NSMutableArray *ary_mark;
    NSMutableArray *ary_random;
    int theRandom;
    BOOL isForward;
    
    int item_account;
    
    BOOL isSingal;
    
    int totalPoint;
    
    BOOL isWrong;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self initWithNavigationBar:@"面試快選" hiddenBackBtn:NO];
    [self initWithUIObjects];
    [self getData];
    [self getRandomForward];
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init  *******
-(void)initWithUIObjects{
    
    //self.allBaseView
    self.allBaseView.frame = CGRectMake(0, [self returnNavAndStatusBarHeight], self.allBaseView.frame.size.width, self.allBaseView.frame.size.height);
    
    
    //
    self.choose_tableView.delegate = self;
    self.choose_tableView.dataSource = self;
    self.choose_tableView.scrollEnabled = NO;
    
    //
    self.correct_imgView.hidden = YES;
    self.correct_imgView.frame = [self fixIconFrame:self.correct_imgView.center iconWidth:self.correct_imgView.frame.size.width];
    
    //
    self.question_label.numberOfLines = 0;
    self.question_label.font = [UIFont boldSystemFontOfSize:17.0];
    self.question_label.adjustsFontSizeToFitWidth = YES;
    
    //
    [self.answer_btn addTarget:self action:@selector(answerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //ary_mark
    ary_mark = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0", nil];
    
    
    self.choose_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - TableView DataSource & Delegate  *******
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cell_id = @"Choose_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //imgView
    UIImageView *imgView = [cell.contentView viewWithTag:11];
    
    imgView.frame = [self fixIconFrame:imgView.center iconWidth:imgView.frame.size.width];
    
    if([ary_mark[indexPath.row] isEqualToString:@"0"]){
        imgView.image = [UIImage imageNamed:@"check_0"];
    }
    else{
        imgView.image = [UIImage imageNamed:@"check_1"];
    }
   
    
    
    //choose_label
    UILabel *choose_label = [cell.contentView viewWithTag:22];
    choose_label.numberOfLines = 0;
    int num = [ary_random[item_account] intValue];
    choose_label.text = [ary_data[num] objectForKey:@"choose"][indexPath.row];
    choose_label.textColor = [UIColor blackColor];
    
    if(isWrong == NO){
        
        NSArray *ary = [[[NSArray alloc] initWithArray:[ary_data[num] objectForKey:@"answer"]]mutableCopy];
        if([ary[indexPath.row] isEqualToString:@"1"]){
            choose_label.textColor = [UIColor redColor];
        }
        else{
            choose_label.textColor = [UIColor blackColor];
        }
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(isSingal){
        //單選
        for (int i = 0; i < ary_mark.count; i++){
            if(indexPath.row == i){
                ary_mark[i] = @"1";
            }
            else{
                ary_mark[i] = @"0";
            }
        }
    }
    else{
        //複選
        if([ary_mark[indexPath.row] isEqualToString:@"0"]){
            ary_mark[indexPath.row] = @"1";
        }
        else{
            ary_mark[indexPath.row] = @"0";
        }
    }
    
    [self.choose_tableView reloadData];
}



#pragma mark - Private Function  *******
-(void)getData{
    
    if(ary_data.count>0){
        [ary_data removeAllObjects];
        ary_data = nil;
    }
    if(ary_data == nil) {
        ary_data = [[NSMutableArray alloc] init];
    }
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Delivery" ofType:@"json"];
    ary_data = [[self parseJson:jsonPath] objectForKey:@"Delivery"];
}

//隨機 ++ / --
-(void)getRandomForward{
    
    int forward = arc4random()%2;
    if(forward == 0){
        isForward = YES;
        NSLog(@"順向");
    }
    else{
        isForward = NO;
        NSLog(@"逆向");
    }
    
    [self getRandomNum];
}

//初始隨機數字
-(void)getRandomNum{

    if(ary_random.count>0){
        [ary_random removeAllObjects];
        ary_random = nil;
    }
    if(ary_random == nil){
        ary_random = [[NSMutableArray alloc] init];
    }
    
    int num = arc4random()%10;
    
    NSLog(@"隨機數字:%d",num);
    
    if(isForward == YES){
        //++
        for(int i = 0; i < 10; num++){
            
            if (num>9){
                num = 0;
            }
            NSLog(@"++隨機數字:%d",num);
            i += 1;
            [ary_random addObject:[NSNumber numberWithInt:num]];
        }
    }
    else{
       //--
        for(int i = 0; i < 10; num--){
        
            if (num<0) {
                num = 9;
            }
            NSLog(@"--隨機數字:%d",num);
            i += 1;
            [ary_random addObject:[NSNumber numberWithInt:num]];
        }
    
    }

    NSLog(@"ary_random:%@",ary_random);
    
    item_account = 0;
    [self refreshTitle];
}

//更新題目
-(void)refreshTitle{
    
    int num = [ary_random[item_account] intValue];
    self.question_label.text = [NSString stringWithFormat:@"(%d)%@",item_account+1,[ary_data[num] objectForKey:@"item"]];
    if([[ary_data[num] objectForKey:@"type"] isEqualToString:@"單選題"]){
        isSingal = YES;
    }
    else{
        isSingal = NO;
    }
    
    isWrong = YES;
}


//answer Btn Action
-(void)answerBtnAction:(UIButton *)btn{
    
    if([btn.titleLabel.text isEqualToString:@"確定答案"]){
        
        self.choose_tableView.userInteractionEnabled = NO;
        
        if(item_account == 9){
            [self.answer_btn setTitle:@"計算分數" forState:UIControlStateNormal];
            [self checkAnswer];
            
        }
        else{
            [self checkAnswer];
            [self.answer_btn setTitle:@"下一題" forState:UIControlStateNormal];
        }
    }
    
    if([btn.titleLabel.text isEqualToString:@"下一題"]){
        item_account += 1;
        self.correct_imgView.hidden = YES;
        [self.answer_btn setTitle:@"確定答案" forState:UIControlStateNormal];
        [self refreshTitle];
        for(int i = 0; i < ary_mark.count; i++){
            ary_mark[i] = @"0";
        }
        self.choose_tableView.userInteractionEnabled = YES;
        [self.choose_tableView reloadData];
    }
    
    if([btn.titleLabel.text isEqualToString:@"計算分數"]){
        [self gotoDeliveryResultVC];
    }
    
}

-(void)checkAnswer{
    int num = [ary_random[item_account] intValue];
    NSArray *ary = [[NSArray alloc] initWithArray:[[ary_data[num] objectForKey:@"answer"] mutableCopy]];
    
    NSLog(@"ary:%@",ary);
    NSLog(@"ary_mark:%@",ary_mark);
    
    int ErrorNum = 0;
    
    for(int i = 0; i < 4; i++){
        if(![ary_mark[i] isEqualToString:ary[i]]){
            ErrorNum += 1;
        }
    }
    
    if(ErrorNum != 0){
        self.correct_imgView.image = [UIImage imageNamed:@"incorrect"];
        isWrong = NO;
        [self.choose_tableView reloadData];
    }
    else{
        self.correct_imgView.image = [UIImage imageNamed:@"correct"];
        isWrong = YES;
        totalPoint += 10;
    }
    
    self.correct_imgView.hidden = NO;
}


//跳到顯示成績頁面
-(void)gotoDeliveryResultVC{
 
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Delivery" bundle:nil];
    DeliveryResultViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"DeliveryResultVC"];
    vc.result_point = totalPoint;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
