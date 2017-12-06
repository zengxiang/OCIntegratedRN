//
//  NSString+Extenison.m
//  BasicFramework
//
//  Created by mills on 17/3/31.
//  Copyright © 2017年 mills. All rights reserved.
//

#import "NSString+Extenison.h"
#import <sys/utsname.h>

@implementation NSString (Extenison)

- (CGSize)sizeWithFont:(UIFont *)font withMaxWidth:(CGFloat)MaxWidth
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(MaxWidth, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font withMaxWidth:MAXFLOAT];
}

- (CGSize)sizeWithFont:(UIFont *)font andMaxWidth:(CGFloat)maxWidth
{
    return [self sizeWithFont:font withMaxWidth:maxWidth];
}

+(BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (NSString *)phoneDisplay:(NSString *)phone
{
    if (!phone||phone.length==0) {
        return @"手机号码不存在";
    }
    if ([phone isMobileNumber]==NO) {
        return @"手机号码不合法";
    }
    
    return phone;
//    return [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
}

+ (NSString *)returnString:(NSString *)string{
    if (string == nil) {
        return @"";
    }
    if (string == NULL) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([string isEqualToString:@"null"]) {
        return @"";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return @"";
    }
    return string;
}

+ (BOOL)IsImageExtension:(NSString*)szFilename
{
    NSString*ext=[szFilename pathExtension];
    return [ext isEqualToString:@"png"]||[ext isEqualToString:@"jpg"];
}

+ (BOOL)IsNumberString:(NSString *)str
{
    if(str.length<=0)
        return NO;
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^[\\+-]?(?:|0|[0-9]\\d{0,})(?:\\.\\d*)?$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    if(numberofMatch > 0)
        return YES;
    
    return NO;
}

+ (BOOL)IsPlusNumberString:(NSString *)str
{
    if(str.length<=0)
        return NO;
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^[\\+2]?(?:|0|[0-9]\\d{0,})(?:\\.\\d*)?$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    
    if(numberofMatch > 0)
        return YES;
    
    return NO;
}

- (BOOL)IsNumberString
{
    return [NSString IsNumberString:self];
}

+ (BOOL)isEmailString:(NSString*)str
{
    NSString*exp=@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; //@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
    NSPredicate*Predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",exp];
    return [Predicate evaluateWithObject:str];
}

- (BOOL)isEmailString
{
    return [NSString isEmailString:self];
}

+ (BOOL)isEnglishString:(NSString*)str
{
    NSString*exp=@"^[A-Za-z]+$";
    NSPredicate*Predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",exp];
    return [Predicate evaluateWithObject:str];
}

- (BOOL)isEnglishString
{
    return [NSString isEnglishString:self];
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    //规定，暂时只要是1开头的11数字的号码，都为合法的号码
    if (mobileNum.length!=11) {
        return NO;
    }
    
    if (![[mobileNum substringToIndex:1] isEqualToString:@"1"]) {
        return NO;
    }
    
    return [NSString IsNumberString:mobileNum];
    
    return YES;
    
    
    
//    /**
//     *手机号码
//     *移动：139,138,137,136,135,134[0-8],147,150,151,152,157,158,159,182,183,184,187,188
//     *联通：130,131,132,155,156,185,186,145
//     *电信：133,1349,153,180,181,189
//     */
//    NSString *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9]|4[57])\\d{8}$";
//    /**
//     10         *中国移动：China Mobile
//     11         *134[0-8],135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147
//     12         */
//    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[0127-9]|8[23478]|47)\\d)\\d{7}$";
//    /**
//     15         *中国联通：China Unicom
//     16         *130,131,132,155,156,185,186,145
//     17         */
//    NSString *CU = @"^1(3[0-2]|5[56]|8[56]|45)\\d{8}$";
//    /**
//     20         *中国电信：China Telecom
//     21         *133,1349,153,180,189
//     22         */
//    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//    /**
//     25         *大陆地区固话及小灵通
//     26         *区号：010,020,021,022,023,024,025,027,028,029
//     27         *号码：七位或八位
//     28         */
//    // NSString *PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//
//    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
//        || ([regextestcm evaluateWithObject:mobileNum] == YES)
//        || ([regextestct evaluateWithObject:mobileNum] == YES)
//        || ([regextestcu evaluateWithObject:mobileNum] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
}

- (BOOL)isMobileNumber
{
    return [NSString isMobileNumber:self];
}

#pragma mark -
const int factor[] = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };//加权因子
const int checktable[] = { 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 };//校验值对应表

+ (BOOL)isIDCard:(NSString *)szIDCard
{
    BOOL result = NO;
    if(szIDCard==nil)
    {
        result = NO;
    }
    else if(szIDCard.length == 18)
    {
        char *ID = (char *)[szIDCard UTF8String];
        int IDNumber[19];
        for(int i = 0; i < 18; i ++)//相当于类型转换
            IDNumber[i] = ID[i] - 48;
        
        
        int checksum = 0;
        for (int i = 0; i < 17; i ++ )
            checksum += IDNumber[i] *factor[i];
        
        if (IDNumber[17] == checktable[checksum % 11] || (ID[17] == 'x' && checktable[checksum % 11] == 10))
            result = YES;
        else
            result = NO;
    }
    else if(szIDCard.length == 15)
    {
        if([szIDCard compare:@"111111111111111"] == NSOrderedSame)
            result = NO;
        else
        {
            NSString *strDate = [NSString stringWithFormat:@"19%@",[szIDCard substringWithRange:NSMakeRange(6, 6)]];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyyMMdd"];
            NSDate *date=[dateFormatter dateFromString:strDate];
            if(date != nil)
                result = YES;
            else
                result = NO;
        }
    }
    else
    {
        result = NO;
    }
    return result;
}

- (BOOL)isIDCard
{
    return [NSString isIDCard:self];
}

+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff)
        {
            if (substring.length > 1)
            {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) *0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f)
                {
                    returnValue = YES;
                }
            }
        }
        else if(substring.length > 1)
        {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3)
            {
                returnValue = YES;
            }
        }
        else
        {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff)
            {
                returnValue = YES;
            }
            else if (0x2B05 <= hs && hs <= 0x2b07)
            {
                returnValue = YES;
            }
            else if (0x2934 <= hs && hs <= 0x2935)
            {
                returnValue = YES;
            }
            else if (0x3297 <= hs && hs <= 0x3299)
            {
                returnValue = YES;
            }
            else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
            {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

- (BOOL)isMakeUpOfNumberAndLetter{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^[A-Za-z0-9]+$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}


- (BOOL)isURL{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

-(BOOL)isChinese{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

+ (BOOL)checkPassword:(NSString *)password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString{
    
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    return [self substringWithRange:range];
    
}



+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil || jsonString.length==0) {
        return nil;
    }
    
//    [NSDictionary dictionaryWithJson:@""];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


+ (NSString *)dictionaryToJsonWithoutFormate:(NSDictionary *)dic
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString*)encodeString:(NSString*)unencodedString{
    NSString*encodedString=(NSString*)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              
                                                              (CFStringRef)unencodedString,
                                                              
                                                              NULL,
                                                              
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
    
}

+(NSString *)phoneType
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString*platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone1,1"]) return  @"iPhone 2G";
    
    if([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,4"]) return@"iPhone 8";
    
    if([platform isEqualToString:@"iPhone10,2"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,5"]) return@"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPhone10,6"]) return@"iPhone X";
    
    if([platform isEqualToString:@"iPod1,1"]) return@"iPod Touch 1G";
    
    if([platform isEqualToString:@"iPod2,1"]) return@"iPod Touch 2G";
    
    if([platform isEqualToString:@"iPod3,1"]) return@"iPod Touch 3G";
    
    if([platform isEqualToString:@"iPod4,1"]) return@"iPod Touch 4G";
    
    if([platform isEqualToString:@"iPod5,1"]) return@"iPod Touch 5G";
    
    if([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    
    if([platform isEqualToString:@"iPad2,1"]) return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if([platform isEqualToString:@"iPad2,3"]) return@"iPad 2";
    
    if([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    
    if([platform isEqualToString:@"iPad3,1"]) return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,2"]) return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,3"]) return@"iPad 3";
    
    if([platform isEqualToString:@"iPad3,4"]) return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,5"]) return@"iPad 4";
    
    if([platform isEqualToString:@"iPad3,6"]) return@"iPad 4";
    
    if([platform isEqualToString:@"iPad4,1"]) return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,2"]) return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,3"]) return@"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"]) return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,5"]) return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,6"]) return@"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"]) return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,8"]) return@"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    
    if([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad6,7"]) return@"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    
    if([platform isEqualToString:@"i386"]) return @"iPhone Simulator";

    if([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
}

+ (NSString *)convertTimeStamp:(NSInteger)timeStamp {
    if (timeStamp == 0) {
        return @"";
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(double)timeStamp / 1000.0];
    
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy.MM.dd";
    df.locale = currentLocale;
    
    return [df stringFromDate:date];
}
@end



@implementation NSNull (Common)

- (NSUInteger)length {
    return 0;
}

- (int)intValue {
    return 0;
}

// 防止一些错误
- (BOOL)isEqualToString:(NSString *)string {
    return NO;
}

- (char *)UTF8String {
    return "";
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet {
    return NSMakeRange(0, 0);
}

- (NSInteger)count {
    return 0;
}

- (float)floatValue {
    return 0.0;
}

- (NSString *)stringValue {
    return @"";
}

@end

@implementation NSNumber (Common)

- (NSUInteger)length {
    return [[self stringValue] length];
}

@end

