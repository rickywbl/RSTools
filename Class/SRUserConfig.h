//
//  SRUserConfig.h
//  SRTools
//
//  Created by 王保霖 on 2016/12/5.
//  Copyright © 2016年 Ricky. All rights reserved.
//

#define CG_SERVICENAME @"RSTOOLS"


#import <Foundation/Foundation.h>

@interface SRUserConfig : NSObject

#define CG_UserName @"userName"
#define CG_Sign @"sign"
#define CG_password @"password"
#define CG_token @"token"
#define CG_Id @"Id"
#define CG_FirstLaunch @"firstLaunch"
#define CG_Agreement @"agreement"
#define CG_expiration @"expiration"
#define CG_Remember @"remember"


//用户名
@property (strong, nonatomic) NSString * userName;
//密码
@property (strong, nonatomic) NSString * password;
//Token
@property (strong, nonatomic) NSString * token;
//过期时间
@property (strong, nonatomic) NSString * expiration;
//第一次使用
@property (strong, nonatomic) NSNumber * firstLaunch;
//统一协议
@property (strong, nonatomic) NSNumber * agreement;
//记住密码
@property (strong, nonatomic) NSNumber * remember;
//唯一识别
@property (strong, nonatomic) NSString * UUID;
//加密
@property (strong, nonatomic) NSString * sign;
//用户ID
@property (strong, nonatomic) NSString * Id;

//sign




+ (instancetype)sharedInstance;

-(void)clearLogin;

-(BOOL)loginStatus;


@end
