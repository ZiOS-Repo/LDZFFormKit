//
//  QnmFormUIModel.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIModel.h"

@implementation QnmFormUIModel
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"modules" : @"QnmFormItemModel"};
}
@end
