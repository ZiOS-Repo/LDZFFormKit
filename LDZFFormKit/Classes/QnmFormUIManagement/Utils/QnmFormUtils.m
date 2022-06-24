//
//  QnmFormUtils.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/24.
//

#import "QnmFormUtils.h"

@implementation QnmFormUtils
//1.时间string转时间戳
+ (NSTimeInterval)stringDateToTimestamp:(NSString *)dateString {
    NSDateFormatter *pFormatter = [[NSDateFormatter alloc] init];
    [pFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *pCurrentDate = [pFormatter dateFromString:dateString];
    return [pCurrentDate timeIntervalSince1970] * 1000;
}

//2.时间戳转换成时间(HH:mm)
+ (NSString *)timestrToTimeSecond:(NSString *)timeStr {//timestr 豪秒
    NSTimeInterval interval = [timeStr doubleValue]/1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *dateString = [formatter stringFromDate: date];
    return dateString;
}

//3.时间string转date
+ (NSDate *)stringChangeToDate:(NSString *)string dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];//创建一个日期格式化器
    dateFormatter.dateFormat = dateFormat ? dateFormat:@"yyyy-MM-dd HH:mm:ss";
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return [dateFormatter dateFromString:string];
}

//4.date转时间string
+ (NSString *)dateChangeToString:(NSDate *)date dateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];//创建一个日期格式化器
    dateFormatter.dateFormat = dateFormat ? dateFormat:@"yyyy-MM-dd HH:mm:ss";//指定转date得日期格式化形式
    return [dateFormatter stringFromDate:date];
}

//5.获取当前的时间string
+ (NSString *)getCurrentCompainedDateString {
    NSDate *localDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *timeString = [formatter stringFromDate:localDate];
    return timeString;
}

//6.获取当前的时间戳
+ (NSTimeInterval)getCurrentTimeInterval {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return [timeSp integerValue];
}

//7.根据生日获取年龄 格式2020/08/13
+ (NSString *)calculateAgeWithDateString:(NSString *)date {
    NSArray * arr = [date componentsSeparatedByString:@"/"];
    //获取当前时间
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    NSInteger year = [dateComponent year];
    NSInteger month = [dateComponent month];
    NSInteger day = [dateComponent day];
    
    NSInteger age;
    if (month > [arr[1] integerValue]) {
        age = year - [arr[0] integerValue];
    } else if (month == [arr[1] integerValue]) {
        if (day >= [arr[2] integerValue]) {
            age = year - [arr[0] integerValue];
        } else {
            age = year - [arr[0] integerValue] - 1;
        }
    } else {
       age = year - [arr[0] integerValue] - 1;
    }
    return [NSString stringWithFormat:@"%ld",age];
}

//8.判断是否是24小时之内 结合上面方法6获取当前时间戳
+ (BOOL)isInaDayWithTimestamp:(NSTimeInterval)timeStamp {
    NSTimeInterval currentTimeInterval = [self getCurrentTimeInterval];
    if (currentTimeInterval - timeStamp < 24 * 60 * 60) {
        return YES;
    }
    return NO;
}

//9.将时间戳转换成特定的形式 几小时前 几分钟前
+ (NSString *)compareCurrentTime:(NSString *)timeStamp {
    NSTimeInterval timeInterval = [timeStamp integerValue];
//    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
    NSTimeInterval currentTimeInterval = [self getCurrentTimeInterval];
    timeInterval = (currentTimeInterval * 1000 - timeInterval) / 1000;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"在线"];
    } else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    } else if((temp = temp / 60) < 12){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    } else {
        result = @"12小时前";
    }
    return  result;
}

//10.获取当前的时间(年月日)
+ (NSString *)getCurrentTimeWithYMD{
    NSDate *localDate = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString * timeString = [formatter stringFromDate:localDate];
    return timeString;
}

//11.获取当前的时间(日)
+ (NSString *)getCurrentTimeWithDay{
    NSDate *localDate = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd";
    NSString * timeString = [formatter stringFromDate:localDate];
    return timeString;
}
@end
