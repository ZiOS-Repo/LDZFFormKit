//
//  FormBaseCell.h
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import "FormBaseCellModel.h"
#import "TntBaseTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@class FormBaseCell;

@protocol FormBaseCellDelegate <NSObject>

@optional
- (void)formCell:(FormBaseCell *)cell event:(id _Nullable)event;

@end
@interface FormBaseCell : TntBaseTableViewCell
@property (nonatomic, weak) id<FormBaseCellDelegate> delegate;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *bodyView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *separator;

- (void)showDebugLine;
@end

NS_ASSUME_NONNULL_END
