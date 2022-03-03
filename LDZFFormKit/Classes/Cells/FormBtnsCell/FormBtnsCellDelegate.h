//
//  FormBtnsCellDelegate.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/3/3.
//

#import <Foundation/Foundation.h>
#import "FormBtnsBean.h"
NS_ASSUME_NONNULL_BEGIN
@class FormBtnsCell;

@protocol FormBtnsCellDelegate <NSObject>

@optional
- (void)formBtnsCellOfValueChanged:(FormBtnsCell *)cell bean:(FormBtnsBean *)bean;
@end
NS_ASSUME_NONNULL_END
