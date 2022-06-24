//
//  QnmFormUIMTemplateCell.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QnmFormUIMTemplateCell;

/**
 cell 里面自定义事件操作传递的block
 
 @param dicInfo 传递的自定义数据
 @param senderCell 当前操作的cell对象自身
 */
typedef void(^QnmFormCellCustomOperation)(NSDictionary *dicInfo, QnmFormUIMTemplateCell *senderCell);

/**
 cell 刷新Cell事件传递的block
 
 @param operation 操作编号 :
    0 刷新
        重走heightForRowAtIndexPath
 
    1 局部刷新Cell
        重走heightForRowAtIndexPath
        重走当前cell的configureWithModel
 @param senderCell 当前操作的view对象自身
 */
typedef void(^QnmFormCellReloadCellOperation)(NSInteger operation, QnmFormUIMTemplateCell *senderCell);

@interface QnmFormUIMTemplateCell : UITableViewCell
@property (nonatomic, copy) QnmFormCellCustomOperation customOperation;
@property (nonatomic, copy) QnmFormCellReloadCellOperation reloadOperation;

+ (NSString *)reuseCellIdentifier;
+ (NSString *)nonReuseCellWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
