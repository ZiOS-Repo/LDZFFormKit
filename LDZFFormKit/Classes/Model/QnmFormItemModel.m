//
//  QnmFormItemModel.m
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormItemModel.h"

@implementation QnmFormItemModel

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"uiScheme" : QnmFormItemUIScheme.class,
        @"valueScheme" : QnmFormItemValueScheme.class
    };
}

// JSON 转为 Model 完成后，该方法会被调用，返回false该model会被忽略
// 同时可以在该model中做一些，转换不能实现的操作，如NSDate类型转换
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    if (![dic.allKeys containsObject:@"uiScheme"]) {
        self.uiScheme = [QnmFormItemUIScheme yy_modelWithDictionary:@{}];
    }
    if (![dic.allKeys containsObject:@"valueScheme"]) {
        self.valueScheme = [QnmFormItemValueScheme yy_modelWithDictionary:@{}];
    }
    return YES;
}
// Model 转为 JSON 完成后，该方法会被调用，返回false该model会被忽略
// 同时可以在该model中做一些，转换不能实现的操作，如NSDate类型转换
//- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic;

@end
