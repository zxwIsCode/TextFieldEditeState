//
//  DaManyViewController.m
//  TextFieldEditeState
//
//  Created by 李保东 on 17/3/20.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "DaManyViewController.h"
#import "PBSafeChangePWDModel.h"
#import "PBSafeChangePWDTableCell.h"

@interface DaManyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIButton *yesBtn;

@property(nonatomic,strong)UIButton *forgetPWDButton;

// 是否可以进入下个VC
@property(nonatomic,assign)BOOL isNextVC;

@property(nonatomic,strong)NSMutableArray *allDataArr;
@end

@implementation DaManyViewController

#pragma mark - Init
- (void)viewDidLoad {
    
    self.title = @"多个TextFeild";

    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.forgetPWDButton];
    [self.view addSubview:self.yesBtn];
    
    PBSafeChangePWDModel *changePWDModel1 =[PBSafeChangePWDModel updateSafeChangePhoneModelWithDic:@{@"left":@"",@"right":@"请输入原密码"}];
    PBSafeChangePWDModel *changePWDModel2 =[PBSafeChangePWDModel updateSafeChangePhoneModelWithDic:@{@"left":@"",@"right":@"请输入新密码"}];
    PBSafeChangePWDModel *changePWDModel3 =[PBSafeChangePWDModel updateSafeChangePhoneModelWithDic:@{@"left":@"",@"right":@"请再次输入新密码"}];
    if (!_allDataArr) {
        self.allDataArr =[NSMutableArray array];
    }
    [self.allDataArr addObject:changePWDModel1];
    [self.allDataArr addObject:changePWDModel2];
    [self.allDataArr addObject:changePWDModel3];
    
    
    [self.tableView reloadData];
    
    [self initAllTapgesture];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tableView.backgroundColor =[UIColor redColor];
    //    self.yesBtn.backgroundColor =[UIColor darkGrayColor];
    self.forgetPWDButton.backgroundColor =[UIColor brownColor];
    
    CGFloat viewSpacing =20 *kAppScale;
    self.tableView.frame =CGRectMake(viewSpacing, viewSpacing, SCREEN_WIDTH -2 *viewSpacing,kSafeChangePWDTableCellHeight *3);
    CGFloat forgetPWDButtonW = 70 *kAppScale;
    self.forgetPWDButton.frame =CGRectMake(SCREEN_WIDTH -forgetPWDButtonW -viewSpacing, CGRectGetMaxY(self.tableView.frame) +15 *kAppScale, forgetPWDButtonW, 15 *kAppScale);
    self.yesBtn.frame =CGRectMake(viewSpacing, CGRectGetMaxY(self.forgetPWDButton.frame)+15 *kAppScale, SCREEN_WIDTH -2 *viewSpacing, 50 *kAppScale);
    
    
}

#pragma mark - Private Methods

-(void)initAllTapgesture {
    UITapGestureRecognizer *gesture =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureHiddenKeyBoard:)];
    [self.view addGestureRecognizer:gesture];
}


-(BOOL)backAllDatasIsHave {
    for (PBSafeChangePWDModel *safeChangePWDModel in self.allDataArr) {
        if (safeChangePWDModel.rightTextStr.length ==0) {
            return NO;
        }
    }
    return YES;
}
#pragma mark - Action Methods

-(void)forgetPWDButtonClick:(UIButton *)button {
    
    [DisplayHelper displaySuccessAlert:@"点击了忘记密码按钮哦!"];
    
}

-(void)yesBtnClick:(UIButton *)button {
    if (self.isNextVC) {
        [DisplayHelper displaySuccessAlert:@"修改登录密码成功哦!"];
    }else {
        [DisplayHelper displayWarningAlert:@"请把所有密码补充完整哦!"];
    }
}

-(void)gestureHiddenKeyBoard:(UITapGestureRecognizer *)gesture {
    [self.view endEditing:YES];
}
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PBSafeChangePWDTableCell *cell =[PBSafeChangePWDTableCell updateWithTableView:tableView];
    if (cell) {
        if (indexPath.row <self.allDataArr.count) {
            cell.safeChangePWDModel =self.allDataArr[indexPath.row];
        }
        cell.backgroundColor =[UIColor lightGrayColor];
        
        // BLock传递实现
        WS(ws);
        cell.tableBlock = ^(PBSafeChangePWDModel *safeChangePWDModel,BOOL isNext){
            //            ws.isNextVC =isNext;
            self.isNextVC =[ws backAllDatasIsHave];
        };
    }
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kSafeChangePWDTableCellHeight;
}


#pragma mark - Setter & Getter

-(void)setIsNextVC:(BOOL)isNextVC {
    _isNextVC =isNextVC;
    if (isNextVC) {
        self.yesBtn.backgroundColor = RGB(33,207,166);
    }else {
        self.yesBtn.backgroundColor = RGBCOLOR(208, 209, 210);
    }
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]init];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.bounces =NO;
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(UIButton *)yesBtn {
    if (!_yesBtn) {
        _yesBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_yesBtn setTitle:@"确认修改" forState:UIControlStateNormal];
        _yesBtn.titleLabel.font =[UIFont systemFontOfSize:20 *kAppScale];
        _yesBtn.layer.cornerRadius =5;
        _yesBtn.backgroundColor = RGBCOLOR(208, 209, 210);
        [_yesBtn addTarget:self action:@selector(yesBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesBtn;
}

-(UIButton *)forgetPWDButton {
    if (!_forgetPWDButton) {
        _forgetPWDButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPWDButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
        _forgetPWDButton.titleLabel.textAlignment =NSTextAlignmentRight;
        _forgetPWDButton.titleLabel.font =[UIFont systemFontOfSize:12 *kAppScale];
        [_forgetPWDButton setTitleColor:RGB(33,207,166) forState:UIControlStateNormal];
        [_forgetPWDButton addTarget:self action:@selector(forgetPWDButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPWDButton;
}


@end
