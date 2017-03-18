//
//  CMHDemoDefine.m
//  ComeMoneyHere
//
//  Created by 李保东 on 16/11/15.
//  Copyright © 2016年 李保东. All rights reserved.
//


/*************Test测试HTTP**************/

NSString *const kTestQQGetNickNameURL = @"/GetQqNikeName";
NSString *const kTestDonationGetListURL = @"/GetDonationList";
NSString *const kTestDonationGetPersonURL = @"/DonationPerson";
/*************用户信息操作**************/
NSString *const kLogin_FindUserPassword = @"/Register/setnewpassword"; // 找回密码
NSString *const kLogin_AppRegister = @"/Register/addtelephone"; // 注册
NSString *const kLogin_RegisterPhoneCode = @"/Register/sms"; // 发送验证码
NSString *const kLogin_AppLogin = @"/Login/login"; // 登录
NSString *const kUsers_UpdateUserPas = @"/User/editpassword"; //修改密码
NSString *const kUsers_UpdateUserPayPas = @"/User/set_paypassword"; //修改支付密码
NSString *const kUsers_UploadUserPhoto = @"/Mobile/uploadImg"; //上传头像
NSString *const kUsers_UpdateUserInfo = @"/User/editnickname"; //修改用户信息

NSString *const kGoods_MyHouse = @"/Goods/MyHouse"; //我的收藏
// 用户信息
NSString *const kUsers_GetUserInfo = @"/User/getuserinfo"; //获取用户信息接口
