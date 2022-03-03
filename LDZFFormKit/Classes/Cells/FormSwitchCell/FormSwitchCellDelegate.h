//
//  FormSwitchCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class FormSwitchCell,FormSwitchBean;

@protocol FormSwitchCellDelegate <NSObject>

@optional
- (void)switchCellOfValueChanged:(FormSwitchCell *)cell bean:(FormSwitchBean *)bean;
@end

NS_ASSUME_NONNULL_END
