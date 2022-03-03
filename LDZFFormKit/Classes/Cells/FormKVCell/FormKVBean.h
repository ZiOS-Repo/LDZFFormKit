//
//  FormKVBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonBean.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormKVBean : FormCommonBean
//value
@property (nonatomic, strong) NSString *val;
@property (nonatomic, strong) UIColor *valColor;
@property (nonatomic, strong) UIFont *valFont;
@end

NS_ASSUME_NONNULL_END
