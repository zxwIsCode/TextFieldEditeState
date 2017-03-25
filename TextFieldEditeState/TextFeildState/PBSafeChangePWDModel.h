//
//  PBSafeChangePhoneModel.h
//  PayBackCoin
//
//  Created by 李保东 on 17/3/17.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBSafeChangePWDModel : NSObject

@property(nonatomic,copy)NSString *leftImage;

@property(nonatomic,copy)NSString *rightPlaceholder;

// 为了改变Button状态的数据源
@property(nonatomic,copy)NSString *rightTextStr;

// 真正的数据为多少,直接拿过来就可以用的情况
@property(nonatomic,copy)NSString *rightReallayTextStr;

+(instancetype)updateSafeChangePhoneModelWithDic:(NSDictionary *)dic;

-(instancetype)initSafeChangePhoneModelWithDic:(NSDictionary *)dic;
@end
