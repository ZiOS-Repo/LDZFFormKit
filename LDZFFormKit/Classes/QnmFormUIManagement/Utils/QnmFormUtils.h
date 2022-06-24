//
//  QnmFormUtils.h
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QnmFormUtils : NSObject
//1.时间string转时间戳
+ (NSTimeInterval)stringDateToTimestamp:(NSString *)dateString;

//2.时间戳转换成时间(HH:mm)
+ (NSString *)timestrToTimeSecond:(NSString *)timeStr;

//3.时间string转date
+ (NSDate *)stringChangeToDate:(NSString *)string dateFormat:(NSString *)dateFormat;

//4.date转时间string
+ (NSString *)dateChangeToString:(NSDate *)date dateFormat:(NSString *)dateFormat;

//5.获取当前的时间string
+ (NSString *)getCurrentCompainedDateString;

//6.获取当前的时间戳
+ (NSTimeInterval)getCurrentTimeInterval;

@end

NS_ASSUME_NONNULL_END
