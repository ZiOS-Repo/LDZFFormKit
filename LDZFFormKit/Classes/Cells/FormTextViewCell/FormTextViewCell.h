//
//  FormTextViewCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCell.h"
#import "FormTextViewBean.h"
NS_ASSUME_NONNULL_BEGIN
@class YYTextView;
@interface FormTextViewCell : FormBaseCell
@property(nonatomic, strong) YYTextView *valTextView;
@end

NS_ASSUME_NONNULL_END
