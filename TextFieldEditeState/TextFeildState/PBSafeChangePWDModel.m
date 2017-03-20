//
//  PBSafeChangePhoneModel.m
//  PayBackCoin
//
//  Created by 李保东 on 17/3/17.
//  Copyright © 2017年 DaviD. All rights reserved.
//

#import "PBSafeChangePWDModel.h"

@implementation PBSafeChangePWDModel

+(instancetype)updateSafeChangePhoneModelWithDic:(NSDictionary *)dic {
    
    return [[self alloc]initSafeChangePhoneModelWithDic:dic];
}

-(instancetype)initSafeChangePhoneModelWithDic:(NSDictionary *)dic{
    
    if (self =[super init]) {
        self.leftImage =dic[@"left"];
        self.rightPlaceholder =dic[@"right"];
    }
    return self;
}

@end
