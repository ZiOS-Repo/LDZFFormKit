//
//  FormSwitchCellModel.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormSwitchCellModel : FormCommonCellModel
@property(nonatomic, assign) BOOL on;
@property(nonatomic, assign) BOOL enable;//是否可以点击
@end

NS_ASSUME_NONNULL_END
