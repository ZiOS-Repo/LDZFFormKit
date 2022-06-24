//
//  FormUIMEventHandle.m
//  LDZFFormKit_Example
//
//  Created by zhuyuhui on 2022/6/24.
//  Copyright © 2022 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormUIMEventHandle.h"

@implementation FormUIMEventHandle

#pragma mark - QnmFormUIMEventProtocol
/**
   模板中的自定义操作事件跳转

   @param model 持有的模块数据
   @param infoDic 传递的自定义数据
   @return 返回值表示是否处理事件，YES处理；NO不处理
 */
- (BOOL)eventCustomOperationWithModel:(QnmFormItemModel *)model info:(NSDictionary *)infoDic {
    return [self.eventHandlerDelegate eventCustomOperationWithModel:model info:infoDic];
}

@end
