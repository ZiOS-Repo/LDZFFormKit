//
//  FormPickerBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonBean.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormPickerBean : FormCommonBean
//val
@property (nonatomic, strong) NSString *val;
@property (nonatomic, strong) UIColor *valColor;
@property (nonatomic, strong) UIFont *valFont;
//placeholder
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, assign) BOOL enableEdit; //是否可编辑
@property (nonatomic, strong) UIImage *extrImg;
@end

NS_ASSUME_NONNULL_END
