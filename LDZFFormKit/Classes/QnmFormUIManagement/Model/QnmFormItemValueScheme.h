//
//  QnmFormItemValueScheme.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QnmFormItemValueScheme : NSObject
//string/
@property(nonatomic, copy) NSString *type;
// 界面描述
@property(nonatomic, copy) NSString *title;
// ~参数名{传给后台的}
@property(nonatomic, copy) NSString *propertyName;
@property(nonatomic, copy) NSString *value;
@property(nonatomic, copy) NSString *placeholder;

#pragma mark - 限制条件
// 限定字符串应符合的表达式条件，符合则有效的表达式
@property(nonatomic, copy) NSString *pattern;
// 内建的一些规则，对字符串的格式做约束，例如电子邮件、日期、域名等
@property(nonatomic, copy) NSString *format;
// 字符串实例字符的最大长度(非负)    ≥0
@property(nonatomic, assign) NSInteger maxLength;
// minLength    字符串实例字符的最小长度(非负)    ≥0
@property(nonatomic, assign) NSInteger minLength;

//表示可以接受的最小值。 x ≥ minimum    数值型
@property(nonatomic, assign) CGFloat minimum;
//表示可以接受的最大值。 x ≤ maximum    数值型
@property(nonatomic, assign) CGFloat maximum;
//开区间最小值，排除等于的情况。x > exclusiveMinimum    数值型
@property(nonatomic, assign) CGFloat exclusiveMinimum;
//开区间最大值，排除等于的情况。x < exclusiveMaximum    数值型
@property(nonatomic, assign) CGFloat exclusiveMaximum;
//要求数值必须是该指定值的整数倍    数值型
@property(nonatomic, assign) CGFloat multipleOf;

@end

NS_ASSUME_NONNULL_END
