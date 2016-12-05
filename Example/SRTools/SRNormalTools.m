//
//  SRNormalTools.m
//  SRTools
//
//  Created by 王保霖 on 2016/12/5.
//  Copyright © 2016年 Ricky. All rights reserved.
//




#import "SRNormalTools.h"
#import<CommonCrypto/CommonDigest.h>

typedef enum {
    RSDateTypeYMD,  // 2016-10-11
    RSDateTypeYMDH, // 2016-10-11 10
    RSDateTypeYMDHE, // 2016-10-11 10:20
    RSDateTypeYMDHES, //2016-10-11 10:20:5
    RSDateTypeMD  //10.11
} RSDateType;

@implementation SRNormalTools


+(NSString *)EncryptionWithParms:(NSDictionary *)parms SecretCode:(NSString *)secretCode{
    
    NSArray * keys = parms.allKeys;
    
    NSMutableString * sign = [[NSMutableString alloc]init];
    
    //[NSString stringWithFormat:@"5-index:%d-%@;4-size:%d-%@;4-type:%d-%@;%@",1,@"1",1,@"4",1,@"1",secretCode]
    
    NSArray *newkeys = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    
    for (int i = 0; i < newkeys.count; i++) {
        
        NSString * key = newkeys[i];
        NSString *value = parms[key];
        
        NSString * temp = [NSString stringWithFormat:@"%ld-%@:%ld-%@;",key.length,key.lowercaseString,value.length,value.lowercaseString];
        
        [sign appendFormat:@"%@",temp];
        
    }
    
    [sign appendString:secretCode];
    
    
    return  [SRNormalTools md5:sign];
}


+(NSString *)dateFormatWithDateStr:(NSString *)dateStr type:(RSDateType)dateType{
    
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    
    // 设置日期格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate * date = [dateFormatter dateFromString:dateStr];
    
    // 设置日期格式
    
    switch (dateType) {
        case RSDateTypeYMD:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case RSDateTypeYMDH:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh"];
            break;
        case RSDateTypeYMDHE:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm"];
            break;
        case RSDateTypeYMDHES:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
            break;
        case RSDateTypeMD:
            [dateFormatter setDateFormat:@"MM.dd"];
            break;
        default:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
            break;
    }
    
    
    NSString *year = [dateFormatter stringFromDate:date];
    
    return year;
}





+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
