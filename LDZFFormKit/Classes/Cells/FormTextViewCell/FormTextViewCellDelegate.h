//
//  FormTextViewCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class FormTextViewCell,FormTextViewBean,YYTextView;
@protocol FormTextViewCellDelegate <NSObject>

@optional
- (BOOL)textViewCell:(FormTextViewCell *)cell bean:(FormTextViewBean *)bean textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewCell:(FormTextViewCell *)cell bean:(FormTextViewBean *)bean textViewDidChange:(YYTextView *)textView;
- (void)textViewCell:(FormTextViewCell *)cell bean:(FormTextViewBean *)bean textViewDidEndEditing:(YYTextView *)textView;
@end

NS_ASSUME_NONNULL_END
