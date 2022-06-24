//
//  QnmFormItemUtils.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/24.
//

#import <Foundation/Foundation.h>
#import "QnmFormItemModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface QnmFormItemUtils : NSObject
+ (void)createT:(void (^)(QnmFormItemModel *item))ctrBlock;
@end

NS_ASSUME_NONNULL_END
