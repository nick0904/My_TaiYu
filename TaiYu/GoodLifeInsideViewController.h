//
//  GoodLifeInsideViewController.h
//  TaiYu
//
//  Created by 曾偉亮 on 2017/7/8.
//  Copyright © 2017年 Nick. All rights reserved.
//

typedef enum{
    
    EnumGoodLife_0,
    EnumGoodLife_1,
    EnumGoodLife_2,
    EnumGoodLife_3
    
}Enum_GoodLife;


#import "BaseViewController.h"

@interface GoodLifeInsideViewController : BaseViewController

@property (nonatomic) Enum_GoodLife m_type;

@end
