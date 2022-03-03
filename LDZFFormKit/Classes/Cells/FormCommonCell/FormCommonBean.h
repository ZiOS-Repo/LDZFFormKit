//
//  FormCommonBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormCommonBean : FormBaseCellModel
//key
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) UIColor *keyColor;
@property (nonatomic, strong) UIFont *keyFont;
@property (nonatomic, assign) CGFloat keyMaxWidth;

@end

NS_ASSUME_NONNULL_END
