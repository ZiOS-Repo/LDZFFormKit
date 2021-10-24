//
//  FormBtnsCell.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCell.h"
#import "FormBtnsCellModel.h"
NS_ASSUME_NONNULL_BEGIN
@class FormBtnsCell;

@protocol FormBtnsCellDelegate <NSObject>

@optional
- (void)btnsCellOfValueChanged:(FormBtnsCell *)cell;
@end
@interface FormBtnsCell : FormCommonCell
@property (nonatomic, weak) id<FormBtnsCellDelegate> btnsCellDelegate;

@end

NS_ASSUME_NONNULL_END
