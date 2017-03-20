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

@property(nonatomic,copy)NSString *rightTextStr;

+(instancetype)updateSafeChangePhoneModelWithDic:(NSDictionary *)dic;

-(instancetype)initSafeChangePhoneModelWithDic:(NSDictionary *)dic;
@end
