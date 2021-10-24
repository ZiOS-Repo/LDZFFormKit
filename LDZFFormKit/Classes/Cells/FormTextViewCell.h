//
//  FormTextViewCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCell.h"
#import "YYText/YYText.h"
#import "FormTextViewCellModel.h"
NS_ASSUME_NONNULL_BEGIN
@class FormTextViewCell;

@protocol FormTextViewCellDelegate <NSObject>

@optional
- (BOOL)textViewCell:(FormTextViewCell *)cell textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewCell:(FormTextViewCell *)cell textViewDidChange:(YYTextView *)textView;
- (void)textViewCell:(FormTextViewCell *)cell textViewDidEndEditing:(YYTextView *)textView;
@end

@interface FormTextViewCell : FormBaseCell
@property (nonatomic, weak) id<FormTextViewCellDelegate> textViewCellDelegate;
@property (nonatomic, strong) YYTextView *valTextView;
@end

NS_ASSUME_NONNULL_END
