//
//  QnmFormItemUtils.m
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/24.
//

#import "QnmFormItemUtils.h"

@implementation QnmFormItemUtils

+ (void)createT:(void (^)(QnmFormItemModel *item))ctrBlock {
    QnmFormItemModel *item = [QnmFormItemModel yy_modelWithDictionary:@{}];
    if (ctrBlock) ctrBlock(item);
}
@end
