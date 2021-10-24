//
//  FormSwitchCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCell.h"
#import "FormSwitchCellModel.h"
NS_ASSUME_NONNULL_BEGIN
@class FormSwitchCell;

@protocol FormSwitchCellDelegate <NSObject>

@optional
- (void)switchCellOfValueChanged:(FormSwitchCell *)cell;
@end

@interface FormSwitchCell : FormCommonCell
@property (nonatomic, weak) id<FormSwitchCellDelegate> switchCellDelegate;
@property (nonatomic, strong) UISwitch *valSwitch;
@end

NS_ASSUME_NONNULL_END
