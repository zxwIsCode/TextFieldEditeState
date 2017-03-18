//
//  CMHDemoDefine.h
//  ComeMoneyHere
//
//  Created by 李保东 on 16/11/15.
//  Copyright © 2016年 李保东. All rights reserved.
//


// 全局枚举专用（需要定义多个VC的情况下）
typedef NS_ENUM(NSInteger, PBChangeMoneyType) {
    PBChangeMoneyTypeUser =0,      //返付宝用户
    PBChangeMoneyTypeMall ,//返付宝商户
   
};

/*************Test测试HTTP**************/

#define kTestHttpHost @"http://192.168.3.199/payback/index.php/Mobile"

UIKIT_EXTERN NSString *const kTestQQGetNickNameURL;  //根据QQ号查询昵称
UIKIT_EXTERN NSString *const kTestDonationGetListURL;  //查询爱心捐款列表
UIKIT_EXTERN NSString *const kTestDonationGetPersonURL;  //查询爱心捐款人的列表

/*************登录注册找回密码**************/

UIKIT_EXTERN NSString *const kLogin_FindUserPassword; //找回密码
UIKIT_EXTERN NSString *const kLogin_AppRegister; //注册
UIKIT_EXTERN NSString *const kLogin_RegisterPhoneCode; //注册验证码
UIKIT_EXTERN NSString *const kLogin_AppLogin; //登录
UIKIT_EXTERN NSString *const kUsers_UpdateUserPas; //修改密码
UIKIT_EXTERN NSString *const kUsers_UpdateUserPayPas; //修改支付密码
UIKIT_EXTERN NSString *const kUsers_UploadUserPhoto; //上传头像
UIKIT_EXTERN NSString *const kUsers_UpdateUserInfo; //修改用户信息

UIKIT_EXTERN NSString *const kGoods_MyHouse; //我的收藏
UIKIT_EXTERN NSString *const kUsers_GetUserInfo; // 获取用户信息

#define kTabBarButtonBaseTag 100
