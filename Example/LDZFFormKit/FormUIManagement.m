//
//  FormUIManagement.m
//  LDZFFormKit_Example
//
//  Created by zhuyuhui on 2022/6/23.
//  Copyright © 2022 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormUIManagement.h"

@implementation FormUIManagement
+ (NSString *)cellClassForModuleType:(NSString *)type {
    return [super cellClassForModuleType:type];
}

+ (NSString *)viewClassForModuleType:(NSString *)type {
    return [super viewClassForModuleType:type];
}

+ (CGFloat)heightForModule:(QnmFormItemModel *)model {
    return [super heightForModule:model];
}
@end
