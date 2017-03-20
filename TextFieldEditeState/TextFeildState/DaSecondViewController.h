//
//  DaSecondViewController.h
//  TextFieldEditeState
//
//  Created by 李保东 on 17/3/20.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "CMBaseViewController.h"

@interface DaSecondViewController : CMBaseViewController

#pragma mark - 子类重写

// 子类实现，防止出现死循环
-(void)nextBtnClick:(UIButton *)button;

// 子类实现，更改按钮的名字
-(NSString *)settingNextBtnTitle;

@end
