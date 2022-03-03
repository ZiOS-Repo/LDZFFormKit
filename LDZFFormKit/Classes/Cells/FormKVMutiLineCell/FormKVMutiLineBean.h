//
//  FormKVMutiLineBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormKVMutiLineBean : FormBaseCellModel
@property (nonatomic, strong) NSAttributedString *key;
@property (nonatomic, strong) NSAttributedString *val;
@property (nonatomic, assign) CGFloat hGap;
@property (nonatomic, assign) CGFloat safeTop;
@property (nonatomic, assign) CGFloat safeBottom;
@property (nonatomic, assign) CGFloat keyMaxWidth;


#pragma mark - Useful Method
+ (NSAttributedString *)attrByText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
