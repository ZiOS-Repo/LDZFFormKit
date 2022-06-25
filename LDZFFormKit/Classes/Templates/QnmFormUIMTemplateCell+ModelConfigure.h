//
//  QnmFormUIMTemplateCell+ModelConfigure.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIMTemplateCell.h"
#import "QnmFormItemModel.h"
#import "QnmFormItemModel+GetData.h"
NS_ASSUME_NONNULL_BEGIN

@interface QnmFormUIMTemplateCell (ModelConfigure)
@property (nonatomic, strong, readonly) QnmFormItemModel *holdModel;
- (void)configureWithModel:(QnmFormItemModel *)model;

@end

NS_ASSUME_NONNULL_END
