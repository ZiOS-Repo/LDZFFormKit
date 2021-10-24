//
//  FormKVCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBaseCell.h"
#import "FormKVCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface FormKVCell : FormBaseCell
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@end

NS_ASSUME_NONNULL_END
