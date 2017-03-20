//
//  DaMainTableViewController.m
//  TextFieldEditeState
//
//  Created by 李保东 on 17/3/18.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "DaMainTableViewController.h"
#import "DaFirstBaseViewController.h"

@interface DaMainTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *allTextStateArr;

@end

@implementation DaMainTableViewController

#pragma mark - Init
- (void)viewDidLoad {
    self.title =@"分类";
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.allTextStateArr =[@[@"一个TextFeild",@"二个TextFeild",@"多个TextFeild"] mutableCopy];
}

#pragma mark - UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allTextStateArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"kShowSecurityQuestionCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (cell) {
        if (indexPath.row <self.allTextStateArr.count) {
            cell.textLabel.text =self.allTextStateArr[indexPath.row];
        }
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
            if (YES) {
                DaFirstBaseViewController *firstVC =[[DaFirstBaseViewController alloc]init];
                [self.navigationController pushViewController:firstVC animated:YES];

            }
            break;
            
        default:
            break;
    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54 *kAppScale;
}

#pragma mark - 继承父类
-(CMNavType)getNavType {
    return CMNavTypeOnlyTitle;
}

#pragma mark - Setter & Getter
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -64) style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.bounces =NO;
    }
    return _tableView;
}
-(NSMutableArray *)allTextStateArr {
    if (!_allTextStateArr) {
        _allTextStateArr =[NSMutableArray array];
    }
    return _allTextStateArr;
}

@end
