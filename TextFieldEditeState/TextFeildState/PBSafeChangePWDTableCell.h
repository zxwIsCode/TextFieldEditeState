//
//  PBSafeChangePWDTableCell.h
//  PayBackCoin
//
//  Created by 李保东 on 17/3/17.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PBSafeChangePWDModel.h"

#define kSafeChangePWDTableCellHeight 64 *kAppScale

typedef void(^SafeChangePhoneTableBlock)(PBSafeChangePWDModel *safeChangePWDModel,BOOL isNext);


@interface PBSafeChangePWDTableCell : UITableViewCell

@property(nonatomic,strong)PBSafeChangePWDModel *safeChangePWDModel;

+(instancetype)updateWithTableView:(UITableView *)tableView;

@property(nonatomic,copy)SafeChangePhoneTableBlock tableBlock;

@end
