//
//  FormPlusReduceCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class FormPlusReduceCell,FormPlusReduceBean;
@protocol FormPlusReduceCellDelegate <NSObject>

@optional
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean clickReduceBtn:(UIButton *)sender;
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean clickPlusBtn:(UIButton *)sender;

- (BOOL)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean textFieldDidChange:(UITextField *)textField;
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean textFieldDidEndEditing:(UITextField *)textField;
@end

NS_ASSUME_NONNULL_END
