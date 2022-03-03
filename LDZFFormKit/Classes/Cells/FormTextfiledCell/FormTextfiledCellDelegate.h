//
//  FormTextfiledCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class FormTextfiledCell,FormTextfiledBean;
@protocol FormTextfiledCellDelegate <NSObject>

@optional
- (BOOL)textfiledCell:(FormTextfiledCell *)cell bean:(FormTextfiledBean *)bean textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (void)textfiledCell:(FormTextfiledCell *)cell bean:(FormTextfiledBean *)bean textFieldDidChange:(UITextField *)textField;
- (void)textfiledCell:(FormTextfiledCell *)cell bean:(FormTextfiledBean *)bean textFieldDidEndEditing:(UITextField *)textField;
///右侧视图
- (UIView *)rightViewForTextField:(UITextField *)textField bean:(FormTextfiledBean *)bean cell:(FormTextfiledCell *)cell;
@end
NS_ASSUME_NONNULL_END
