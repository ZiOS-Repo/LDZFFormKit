//
//  FormPlusReduceCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCell.h"
#import "FormPlusReduceCellModel.h"
NS_ASSUME_NONNULL_BEGIN
@class FormPlusReduceCell;

@protocol FormPlusReduceCellDelegate <NSObject>

@optional
- (void)plusReduceCell:(FormPlusReduceCell *)cell clickReduceBtn:(UIButton *)sender;
- (void)plusReduceCell:(FormPlusReduceCell *)cell clickPlusBtn:(UIButton *)sender;

- (BOOL)plusReduceCell:(FormPlusReduceCell *)cell textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string;
- (void)plusReduceCell:(FormPlusReduceCell *)cell textFieldDidChange:(UITextField *)textField;
- (void)plusReduceCell:(FormPlusReduceCell *)cell textFieldDidEndEditing:(UITextField *)textField;
@end
@interface FormPlusReduceCell : FormCommonCell
@property (nonatomic, weak) id<FormPlusReduceCellDelegate> plusReduceCellDelegate;
@property (nonatomic, strong) UITextField *valTextfiled;
@property (nonatomic, strong) UIButton *reduceBtn;
@property (nonatomic, strong) UIButton *plusBtn;
@end

NS_ASSUME_NONNULL_END
