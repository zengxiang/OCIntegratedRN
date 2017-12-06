//
//  NSString+Extenison.h
//  BasicFramework
//
//  Created by mills on 17/3/31.
//  Copyright © 2017年 mills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extenison)

//返回字符串高度
- (CGSize)sizeWithFont:(UIFont *)font;

//根据宽度返回字符串高度
- (CGSize)sizeWithFont:(UIFont *)font withMaxWidth:(CGFloat)MaxWidth;

//是否是空字符串
+ (BOOL)isBlankString:(NSString *)string;

//返回手机号码格式 137****3214
+(NSString *)phoneDisplay:(NSString *)phone;

//返回当前字符串或空字符串
+ (NSString *)returnString:(NSString *)string;

//是否是图片资源
+ (BOOL)IsImageExtension:(NSString*)szFilename;

//是否全是数字
+ (BOOL)IsNumberString:(NSString *)str;
- (BOOL)IsNumberString;

+ (BOOL)IsPlusNumberString:(NSString *)str;

//是否是电子邮件
+ (BOOL)isEmailString:(NSString*)str;
- (BOOL)isEmailString;

//是否全是英文
+ (BOOL)isEnglishString:(NSString*)str;
- (BOOL)isEnglishString;

//是否是手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
- (BOOL)isMobileNumber;

//是否是身份证号码
+ (BOOL)isIDCard:(NSString *)szIDCard;
- (BOOL)isIDCard;

//字符串是否包含表情
+ (BOOL)stringContainsEmoji:(NSString *)string;

//字符串是否包含数字和字母
- (BOOL)isMakeUpOfNumberAndLetter;

//链接是否正确
- (BOOL)isURL;

//是否是中文
- (BOOL)isChinese;

//用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password;

//截取字符串中间部分
- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString;

//字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//字典转json
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

//字典转json
+ (NSString*)dictionaryToJsonWithoutFormate:(NSDictionary *)dic;

//encode编码
+ (NSString*)encodeString:(NSString*)unencodedString;
//设备类型
+(NSString *) phoneType;
// 时间戳转字符串
+ (NSString *)convertTimeStamp:(NSInteger)timeStamp;
@end



@interface NSNull (Common)

/**
 *  这里的方法 都是为了防止一些闪退,崩溃
 */

/**
 *  一些nsnull的字符串调用length方法闪退 在这里做下处理
 */
- (NSUInteger)length;

- (int)intValue;

- (BOOL)isEqualToString:(NSString *)string;

- (char *)UTF8String;

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;

- (NSInteger)count;

- (float)floatValue;

- (NSString *)stringValue;

@end

@interface NSNumber (Common)

- (NSUInteger)length;

@end
