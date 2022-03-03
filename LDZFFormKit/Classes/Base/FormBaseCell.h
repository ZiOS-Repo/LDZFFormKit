//
//  FormBaseCell.h
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import <LDZFBaseCell/LDZFBaseCell.h>
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import "FormBaseCellModel.h"
#import "FormCellDelegate.h"
NS_ASSUME_NONNULL_BEGIN
@interface FormBaseCell : LdzfTemplateCell
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *bodyView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *separator;
@property(nonatomic, weak) id <FormCellDelegate>formDelegate;
- (void)showDebugLine;
@end

NS_ASSUME_NONNULL_END
