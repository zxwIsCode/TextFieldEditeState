//
//  PBChangeMoneyBaseViewController.h
//  PayBackCoin
//
//  Created by 李保东 on 17/3/9.
//  Copyright © 2017年 DaviD. All rights reserved.
//  这是所有的上面一个TextFeild，下面一个Button的基类

#import "CMBaseViewController.h"

@interface DaFirstBaseViewController : CMBaseViewController

@property(nonatomic,strong)UILabel *leftLable;

@property(nonatomic,strong)UITextField *textField;

@property(nonatomic,strong)UIButton *downBtn;

@property(nonatomic,strong)UIView *superView;

// 是否允许进入下一个界面
@property(nonatomic,assign)BOOL isComeNext;

#pragma mark - 子类继承
-(NSString *)customRightTextFeildPlaceholder;
-(NSString *)customLeftLableText;
-(NSString *)customDownBtnTitleStr;
// 点击下一步的按钮
-(void)downBtnClick:(UIButton *)button;
@end
