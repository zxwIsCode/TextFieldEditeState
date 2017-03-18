//
//  PBChangeMoneyBaseViewController.m
//  PayBackCoin
//
//  Created by 李保东 on 17/3/9.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "PBChangeMoneyBaseViewController.h"

@interface PBChangeMoneyBaseViewController ()<UITextFieldDelegate>




@end

@implementation PBChangeMoneyBaseViewController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.superView];
    [self.superView addSubview:self.leftLable];
    
    [self.superView addSubview:self.textField];
    
    [self.view addSubview:self.downBtn];
    
    [self initAllTapgesture];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGFloat viewSpacing =24 *kAppScale;

    self.superView.frame =CGRectMake(0, viewSpacing, SCREEN_WIDTH, 50 *kAppScale);
    self.leftLable.frame =CGRectMake(20 *kAppScale, 0, 90 *kAppScale, 50 *kAppScale);
    
    self.textField.frame =CGRectMake(CGRectGetMaxX(self.leftLable.frame) +20 *kAppScale, 0, 240 *kAppScale, 50 *kAppScale);
    self.downBtn.frame =CGRectMake(20 *kAppScale, CGRectGetMaxY(self.superView.frame) +viewSpacing, SCREEN_WIDTH -2 *20 *kAppScale, 44 *kAppScale);
    
//    self.superView.backgroundColor =[UIColor redColor];
//    self.leftLable.backgroundColor =[UIColor orangeColor];
//    self.textField.backgroundColor =[UIColor brownColor];
//    self.downBtn.backgroundColor =[UIColor darkGrayColor];
    
     self.superView.backgroundColor =[UIColor whiteColor];
     self.downBtn.backgroundColor = RGBCOLOR(208, 209, 210);
    
}

#pragma mark - Private Methods

-(void)initAllTapgesture {
    UITapGestureRecognizer *gesture =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureHiddenKeyBoard:)];
    [self.view addGestureRecognizer:gesture];
}


#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.isComeNext =textField.text.length;

}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    self.isComeNext =textField.text.length;

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length ==1) {
        if (range.location ==1 &range.length ==0) {
            self.isComeNext =YES;
            return YES;
        }
        self.isComeNext =NO;
        return YES;

    }
    self.isComeNext =YES;
    return YES;
  
}

#pragma mark - Action Methods
-(void)gestureHiddenKeyBoard:(UITapGestureRecognizer *)gesture {
    [self.textField endEditing:YES];
}
#pragma mark - 子类继承

-(NSString *)customRightTextFeildPlaceholder {
    return @"请填写对方返付宝账户";
}

-(NSString *)customLeftLableText {
    return @"对方账户";
}
-(NSString *)customDownBtnTitleStr {
    return @"下一步";
}

// 点击下一步的按钮
-(void)downBtnClick:(UIButton *)button {
    if (self.isComeNext) { //选中状态的时候才可以进去
        DDLog(@"可以进入下个界面");
    }else {
        [DisplayHelper displayWarningAlert:@"请填写对方账户信息哦!"];
    }
    
}
#pragma mark - Setter & Getter

-(void)setIsComeNext:(BOOL)isComeNext {
    _isComeNext =isComeNext;
    if (isComeNext) {
//        self.downBtn.backgroundColor =[UIColor greenColor];
        self.downBtn.backgroundColor = RGB(33,207,166);
    }else {
//        self.downBtn.backgroundColor =[UIColor darkGrayColor];
        self.downBtn.backgroundColor = RGBCOLOR(208, 209, 210);
    }
}

-(UIView *)superView {
    if (!_superView) {
        _superView =[[UIView alloc]init];
    }
    return _superView;
}

-(UILabel *)leftLable {
    if (!_leftLable) {
        _leftLable =[[UILabel alloc]init];
        _leftLable.textAlignment =NSTextAlignmentRight;
        _leftLable.font =[UIFont systemFontOfSize:16 *kAppScale];
        _leftLable.text =[self customLeftLableText];
    }
    return _leftLable;
}
-(UITextField *)textField {
    if (!_textField) {
        _textField =[[UITextField alloc]init];
        _textField.delegate =self;
        _textField.textAlignment =NSTextAlignmentLeft;
        _textField.placeholder =[self customRightTextFeildPlaceholder];
        _textField.font =[UIFont systemFontOfSize:15 *kAppScale];

    }
    return _textField;
}

-(UIButton *)downBtn {
    if (!_downBtn) {
        _downBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_downBtn setTitle:[self customDownBtnTitleStr] forState:UIControlStateNormal];
        _downBtn.layer.cornerRadius =5;
//        [_downBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_downBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_downBtn addTarget:self action:@selector(downBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downBtn;
}

@end
