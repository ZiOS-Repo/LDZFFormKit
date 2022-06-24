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

@end
