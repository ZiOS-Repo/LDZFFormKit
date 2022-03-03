//
//  FormCenterBtnBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormCenterBtnBean : FormBaseCellModel
//val
@property (nonatomic, strong) NSString *val;
@property (nonatomic, strong) UIColor *valColor;
@property (nonatomic, strong) UIFont *valFont;
@property (nonatomic, strong) UIImage *image;
@end

NS_ASSUME_NONNULL_END
