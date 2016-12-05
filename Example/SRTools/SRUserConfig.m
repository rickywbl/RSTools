//
//  SRUserConfig.m
//  SRTools
//
//  Created by 王保霖 on 2016/12/5.
//  Copyright © 2016年 Ricky. All rights reserved.
//

#import "SRUserConfig.h"
#import "SFHFKeychainUtils.h"

@interface SRUserConfig()

@property (nonatomic, strong) NSUserDefaults *defaults;

@end

@implementation SRUserConfig
@synthesize token = _token;
@synthesize expiration = _expiration;
@synthesize password = _password;
@synthesize userName = _userName;
@synthesize agreement = _agreement;
@synthesize firstLaunch = _firstLaunch;
@synthesize sign = _sign;


+ (instancetype)sharedInstance
{
    static SRUserConfig* instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [SRUserConfig new];
    });
    
    return instance;
}

-(instancetype)init{
    
    if(self = [super init]){
        
        self.defaults = [NSUserDefaults standardUserDefaults];
        
    }
    
    return self;
}


-(void)clearLogin{
    
    self.userName = nil;
    self.password = nil;
    self.token = nil;
    self.expiration = nil;
    self.Id = nil;
}


-(BOOL)loginStatus{
    
    return [self.defaults objectForKey:CG_Id] == nil ? NO:YES;
}



#pragma mark --- SET&&GET

// 用户名
- (NSString *)userName
{
    
    if([self.defaults objectForKey:CG_UserName] == nil){
        
        return @"";
    }
    return (NSString *)[self.defaults objectForKey:CG_UserName];
}

- (void)setUserName:(NSString *)userName
{
    [self.defaults setObject:userName forKey:CG_UserName];
    [self.defaults synchronize];
}



//加密
- (NSString *)sign
{
    return (NSString *)[self.defaults objectForKey:CG_Sign];
}

- (void)setSign:(NSString *)sign
{
    [self.defaults setObject:sign forKey:CG_Sign];
    [self.defaults synchronize];
}


// 密码

- (NSString *)password
{
    return  (NSString *)[self.defaults objectForKey:CG_password];
}

- (void)setPassword:(NSString *)password
{
    [self.defaults setObject:password forKey:CG_password];
    [self.defaults synchronize];
    
}

//过期时间

- (NSString *)expiration
{
    return (NSString *)[self.defaults objectForKey:CG_expiration];
}

- (void)setExpiration:(NSString *)expiration
{
    [self.defaults setObject:expiration forKey:CG_expiration];
    [self.defaults synchronize];
}

//Token

- (NSString *)token

{
    
    if([self.defaults objectForKey:CG_token] == nil){
        
        return @"";
    }
    return (NSString *)[self.defaults objectForKey:CG_token];
}



- (void)setToken:(NSString *)token
{
    [self.defaults setObject:token forKey:CG_token];
    [self.defaults synchronize];
}

//userID
- (NSString *)Id

{
    
    if([self.defaults objectForKey:CG_Id] == nil){
        
        return @"";
    }
    return [NSString stringWithFormat:@"%@",[self.defaults objectForKey:CG_Id]];
}



- (void)setId:(NSString *)Id
{
    [self.defaults setObject:Id forKey:CG_Id];
    [self.defaults synchronize];
}



-(NSNumber *)firstLaunch{
    
    
    return (NSNumber *)[self.defaults objectForKey:CG_FirstLaunch];
}



-(NSString *)UUID{
    
    NSString *SERVICE_NAME = CG_SERVICENAME;//最好用程序的bundle id
    
    NSString *str =  [SFHFKeychainUtils getPasswordForUsername:@"UUID" andServiceName:SERVICE_NAME error:nil];
    
    return str;
    
}

-(void)setFirstLaunch:(NSNumber *)firstLaunch{
    
    [self.defaults setObject:firstLaunch forKey:CG_FirstLaunch];
}


-(NSNumber *)agreement{
    
    
    return (NSNumber *)[self.defaults objectForKey:CG_Agreement];
}



-(void)setAgreement:(NSNumber *)agreement{
    
    [self.defaults setObject:agreement forKey:CG_Agreement];
}


-(NSNumber *)remember{
    
    
    return (NSNumber *)[self.defaults objectForKey:CG_Remember];
}



-(void)setRemember:(NSNumber *)remember{
    
    [self.defaults setObject:remember forKey:CG_Remember];
}

@end
