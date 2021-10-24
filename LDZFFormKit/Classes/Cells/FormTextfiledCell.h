//
//  FormTextfiledCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCell.h"
#import "FormTextfiledCellModel.h"
NS_ASSUME_NONNULL_BEGIN
@class FormTextfiledCell;

@protocol FormTextfiledCellDelegate <NSObject>

@optional
- (BOOL)textfiledCell:(FormTextfiledCell *)cell textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (void)textfiledCell:(FormTextfiledCell *)cell textFieldDidChange:(UITextField *)textField;
- (void)textfiledCell:(FormTextfiledCell *)cell textFieldDidEndEditing:(UITextField *)textField;
///右侧视图
- (UIView *)rightViewForTextField:(UITextField *)textField cell:(FormTextfiledCell *)cell;
@end
@interface FormTextfiledCell : FormCommonCell
@property (nonatomic, weak) id<FormTextfiledCellDelegate> inputCellDelegate;
@property (nonatomic, strong) UITextField *valTextfiled;
@end

NS_ASSUME_NONNULL_END
