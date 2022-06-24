//
//  FormUIMAdapter.m
//  LDZFFormKit_Example
//
//  Created by zhuyuhui on 2022/6/23.
//  Copyright © 2022 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormUIMAdapter.h"

@implementation FormUIMAdapter

- (void)setDataModel:(QnmFormUIModel *)model forTableView:(UITableView *)tableView {
    [super setDataModel:model forTableView:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0.f;
    if (indexPath.row >= self.modelTopOffset && indexPath.row < self.baseModules.modules.count + self.modelTopOffset) {
        height = [self srstableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return height;
}



#pragma mark - QnmFormUIMEventProtocol
/**
   模板中的自定义操作事件跳转

   @param model 持有的模块数据
   @param infoDic 传递的自定义数据
   @return 返回值表示是否处理事件，YES处理；NO不处理
 */
- (BOOL)eventCustomOperationWithModel:(QnmFormItemModel *)model info:(NSDictionary *)infoDic {
    BOOL result = NO;
    if ([model.type isEqualToString:QnmFormItemOaSubmit]) {
        [self archiveData];
        result = YES;
    }
    return result;
}

- (void)archiveData {
    NSLog(QnmFormItemOaSubmit);
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    for (QnmFormItemModel *subModel in self.baseModules.modules) {
        if (!isStringEmptyOrNil(subModel.valueScheme.propertyName)) {
            [parameter setValue:subModel.valueScheme.value forKey:subModel.valueScheme.propertyName];
        }
    }
    NSLog(@"%@",parameter);
}
@end
