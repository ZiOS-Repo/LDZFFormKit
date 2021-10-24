//
//  FormPickerCellModel.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormPickerCellModel : FormCommonCellModel
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
