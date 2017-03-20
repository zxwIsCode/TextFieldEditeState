//
//  PBSafeChangePWDTableCell.m
//  PayBackCoin
//
//  Created by 李保东 on 17/3/17.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "PBSafeChangePWDTableCell.h"
@interface PBSafeChangePWDTableCell ()<UITextFieldDelegate>

@property(nonatomic,strong)UIImageView *leftImageView;

@property(nonatomic,strong)UITextField *rightTextFeild;

@property(nonatomic,strong)UIView *lineView;

// 是否允许进入下一个界面
@property(nonatomic,assign)BOOL isComeNext;

@end
@implementation PBSafeChangePWDTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)updateWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"kSafeChangePWDTableCellId";
    PBSafeChangePWDTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PBSafeChangePWDTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftImageView =[[UIImageView alloc]init];
        self.rightTextFeild =[[UITextField alloc]init];
        self.lineView =[[UIView alloc]init];
        
        CGFloat viewSpacing =10 *kAppScale;
        self.leftImageView.frame =CGRectMake(viewSpacing, 0, 60, kSafeChangePWDTableCellHeight -2);
        self.rightTextFeild.frame =CGRectMake(CGRectGetMaxX(self.leftImageView.frame) +viewSpacing, 0, 240, kSafeChangePWDTableCellHeight -2);
        self.lineView.frame =CGRectMake(0, kSafeChangePWDTableCellHeight -1, SCREEN_WIDTH, 1);
        
        [self addSubview:self.leftImageView];
        [self addSubview:self.rightTextFeild];
        [self addSubview:self.lineView];
        
        // 属性设置
        self.rightTextFeild.delegate =self;
        
        self.leftImageView.backgroundColor =[UIColor redColor];
        self.rightTextFeild.backgroundColor =[UIColor darkGrayColor];
        self.lineView.backgroundColor =[UIColor brownColor];
    }
    return self;
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    _safeChangePWDModel.rightTextStr =textField.text;
    
    self.isComeNext =textField.text.length;
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    _safeChangePWDModel.rightTextStr =textField.text;
    
    self.isComeNext =textField.text.length;
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    _safeChangePWDModel.rightTextStr =textField.text; //先赋值，后面再具体改值
    if (range.location ==0 &range.length ==1) { // 从1个字母到0个字母（删除的情况）
        _safeChangePWDModel.rightTextStr =@"";
        self.isComeNext =NO;
        return YES;
    }else{ // 有字母的情况
        if (range.location ==0 & range.length ==0) { // 从0个字母到1个 (添加的情况)
            _safeChangePWDModel.rightTextStr =string;
        }
        self.isComeNext =YES;
        return YES;
    }
    
    DDLog(@"location = %lu,length = %lu ",range.location,range.length);
    return YES;
    
}

-(void)setIsComeNext:(BOOL)isComeNext {
    _isComeNext =isComeNext;
    if (self.tableBlock) {
        self.tableBlock(_safeChangePWDModel,isComeNext);
    }
    
}

-(void)setSafeChangePWDModel:(PBSafeChangePWDModel *)safeChangePWDModel {
    _safeChangePWDModel = safeChangePWDModel;
    if (safeChangePWDModel.leftImage) {
        self.leftImageView.image =[UIImage imageNamed:safeChangePWDModel.leftImage];
    }
    self.rightTextFeild.placeholder =safeChangePWDModel.rightPlaceholder;
}
@end
