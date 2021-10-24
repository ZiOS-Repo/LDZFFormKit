//
//  FormTextfiledCellModel.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormTextfiledCellModel : FormCommonCellModel
//val
@property (nonatomic, strong) NSString *val;
@property (nonatomic, strong) UIColor *valColor;
@property (nonatomic, strong) UIFont *valFont;
//placeholder
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, assign) BOOL enableEdit; //是否可编辑
/*
 UIKeyboardTypeNumberPad 纯数字
 UIKeyboardTypePhonePad 纯数字 + 特殊字符（+，*，#）
 UIKeyboardTypeDecimalPad 纯数字 + 特殊字符（.）
 */
@property (nonatomic) UIKeyboardType keyboardType;   // default is UIKeyboardTypeDefault
@property (nonatomic) UIReturnKeyType returnKeyType; // default is UIReturnKeyDefault (See note

@end

NS_ASSUME_NONNULL_END
