//
//  DaSecondViewController.m
//  TextFieldEditeState
//
//  Created by 李保东 on 17/3/20.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "DaSecondViewController.h"

@interface DaSecondViewController ()<UITextFieldDelegate>

// 是否允许进入下一个界面
@property(nonatomic,assign)BOOL isComeNext;

@property(nonatomic,strong)UIView *phoneSuperView;// 父

@property(nonatomic,strong)UIImageView *phoneIconImageView;

@property(nonatomic,strong)UITextField *phoneTextFeild;


@property(nonatomic,strong)UITextField *codeTextFeild;

@property(nonatomic,strong)UIView *codeSuperView;// 父

@property(nonatomic,strong)UIImageView *codeIconImageView;

@property(nonatomic,strong)UIButton *nextBtn;

@end

@implementation DaSecondViewController

- (void)viewDidLoad {
    
    self.title = @"二个TextFeild";

    [super viewDidLoad];
    [self.view addSubview:self.phoneSuperView];
    [self.view addSubview:self.codeSuperView];
    [self.view addSubview:self.nextBtn];
    
    [self.phoneSuperView addSubview:self.phoneIconImageView];
    [self.phoneSuperView addSubview:self.phoneTextFeild];
    
    [self.codeSuperView addSubview:self.codeIconImageView];
    [self.codeSuperView addSubview:self.codeTextFeild];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGFloat viewSpacing =20 *kAppScale;
    CGFloat superViewHeight =60 *kAppScale;
    CGFloat subViewHeight =36 *kAppScale;
    CGFloat subViewSpacing =(superViewHeight -subViewHeight) *0.5;
    self.phoneSuperView.frame =CGRectMake(viewSpacing, viewSpacing, SCREEN_WIDTH -2 *viewSpacing, superViewHeight);
    self.codeSuperView.frame =CGRectMake(viewSpacing, CGRectGetMaxY(self.phoneSuperView.frame), SCREEN_WIDTH -2 *viewSpacing, superViewHeight);
    self.nextBtn.frame =CGRectMake(viewSpacing, CGRectGetMaxY(self.codeSuperView.frame) +viewSpacing, SCREEN_WIDTH -2 *viewSpacing, 50 *kAppScale);
    
    self.phoneIconImageView.frame =CGRectMake(subViewSpacing, subViewSpacing, 40 *kAppScale, subViewHeight);
    self.phoneTextFeild.frame =CGRectMake(CGRectGetMaxX(self.phoneIconImageView.frame) +subViewSpacing, subViewSpacing, 200 *kAppScale, subViewHeight);
    
    
    
    self.codeIconImageView.frame =CGRectMake(subViewSpacing, subViewSpacing, 40 *kAppScale, subViewHeight);
    self.codeTextFeild.frame =CGRectMake(CGRectGetMaxX(self.codeIconImageView.frame) +subViewSpacing, subViewSpacing, 200 *kAppScale, subViewHeight);
    
    //测试颜色
    self.phoneSuperView.backgroundColor =[UIColor redColor];
    self.phoneIconImageView.backgroundColor =[UIColor darkGrayColor];
    self.phoneTextFeild.backgroundColor =[UIColor brownColor];
    
    self.codeSuperView.backgroundColor =[UIColor blueColor];
    self.codeIconImageView.backgroundColor =[UIColor yellowColor];
    self.codeTextFeild.backgroundColor =[UIColor brownColor];
    
    self.nextBtn.backgroundColor = RGBCOLOR(208, 209, 210);
    
}
#pragma mark - Private Methods

-(void)settingNextBtnState:(UITextField *)textField {
    if (textField ==self.phoneTextFeild) {
        if (self.codeTextFeild.text.length) {
            self.isComeNext =textField.text.length;
            
        }else {
            self.isComeNext =NO;
        }
    }else {
        if (self.phoneTextFeild.text.length) {
            self.isComeNext =textField.text.length;
            
        }else {
            self.isComeNext =NO;
        }
    }
    
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    //    self.nowEditeText =textField.text ;
    [self settingNextBtnState:textField];
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    //    self.nowEditeText =textField.text;
    [self settingNextBtnState:textField];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    DDLog(@"location = %lu,length = %lu ",range.location,range.length);
    
    if (range.location ==0 &range.length ==1) { // 从1个字母到0个字母（删除的情况）必然不能进行下一步
        self.isComeNext =NO;
        
        return YES;
    }else{ // 有字母的情况
        if (range.location ==0 & range.length ==0) { // 从0个字母到1个 (添加的情况) 当前的必然可以走下一步，但要判断另一个是否可以走下一步
            if (textField ==self.phoneTextFeild) {
                if (self.codeTextFeild.text.length) {
                    self.isComeNext =YES;
                    
                }else {
                    self.isComeNext =NO;
                }
            }else {
                if (self.phoneTextFeild.text.length) {
                    self.isComeNext =YES;
                    
                }else {
                    self.isComeNext =NO;
                }
            }
            
            return YES;
            
        }
        // 其他情况正常处理！
        [self settingNextBtnState:textField];
        
        return YES;
    }
    
    DDLog(@"location = %lu,length = %lu ",range.location,range.length);
    return YES;
    
}
#pragma mark - 子类重写

-(void)nextBtnClick:(UIButton *)button {
    
    if (self.isComeNext) {
        [DisplayHelper displaySuccessAlert:@"点击了下一步按钮哦!"];
        
    }else {
        [DisplayHelper displayWarningAlert:@"请填写完整验证码哦!"];
    }
    
}

-(NSString *)settingNextBtnTitle {
    return @"下一步";
}


#pragma mark - Setter & Getter
-(void)setIsComeNext:(BOOL)isComeNext {
    _isComeNext =isComeNext;
    if (isComeNext) {
        self.nextBtn.backgroundColor = RGB(33,207,166);
    }else {
        self.nextBtn.backgroundColor = RGBCOLOR(208, 209, 210);
    }
}

-(UIView *)phoneSuperView {
    if (!_phoneSuperView) {
        _phoneSuperView =[[UIView alloc]init];
    }
    return _phoneSuperView;
}
-(UIView *)codeSuperView {
    if (!_codeSuperView) {
        _codeSuperView =[[UIView alloc]init];
    }
    return _codeSuperView;
}
-(UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.layer.cornerRadius =5;
        _nextBtn.titleLabel.font =[UIFont systemFontOfSize:20 *kAppScale];
        [_nextBtn setTitle:[self settingNextBtnTitle] forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}


-(UIImageView *)phoneIconImageView {
    if (!_phoneIconImageView) {
        _phoneIconImageView =[[UIImageView alloc]init];
    }
    return _phoneIconImageView;
}

-(UIImageView *)codeIconImageView {
    if (!_codeIconImageView) {
        _codeIconImageView =[[UIImageView alloc]init];
    }
    return _codeIconImageView;
}

-(UITextField *)codeTextFeild {
    if (!_codeTextFeild) {
        _codeTextFeild =[[UITextField alloc]init];
        _codeTextFeild.placeholder =@"短信验证码";
        _codeTextFeild.delegate =self;
    }
    return _codeTextFeild;
}

-(UITextField *)phoneTextFeild {
    if (!_phoneTextFeild) {
        _phoneTextFeild =[[UITextField alloc]init];
        _phoneTextFeild.placeholder =@"请输入新的手机号码";
        _phoneTextFeild.delegate =self;
    }
    return _phoneTextFeild;
}


@end
