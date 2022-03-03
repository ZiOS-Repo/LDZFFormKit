//
//  FormCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>
#import "FormBtnsCellDelegate.h"
#import "FormTextViewCellDelegate.h"
#import "FormTextfiledCellDelegate.h"
#import "FormPlusReduceCellDelegate.h"
#import "FormSliderCellDelegate.h"
#import "FormSwitchCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@class FormBaseCell;
@protocol FormCellDelegate
<
FormBtnsCellDelegate,
FormTextViewCellDelegate,
FormTextfiledCellDelegate,
FormPlusReduceCellDelegate,
FormSliderCellDelegate,
FormSwitchCellDelegate
>

- (void)formCell:(FormBaseCell *)cell event:(nullable id)event;


@end

NS_ASSUME_NONNULL_END

