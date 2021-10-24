//
//  FormAttrCellModel.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormAttrCellModel : FormBaseCellModel
@property (nonatomic, assign) CGFloat safeTop;
@property (nonatomic, assign) CGFloat safeBottom;
@property (nonatomic, strong) NSAttributedString *val;
@end

NS_ASSUME_NONNULL_END
