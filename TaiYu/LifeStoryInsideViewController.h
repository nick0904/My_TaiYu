//
//  LifeStoryInsideViewController.h
//  TaiYu
//
//  Created by 曾偉亮 on 2017/8/2.
//  Copyright © 2017年 Nick. All rights reserved.
//

typedef enum{
    
    EnumLifeStory_0,
    EnumLifeStory_1,
    EnumLifeStory_2,
    EnumLifeStory_3
    
}Enum_LifeStory;


#import "BaseViewController.h"

@interface LifeStoryInsideViewController : BaseViewController
    
@property (nonatomic) Enum_LifeStory lifeStory_type;

@end
