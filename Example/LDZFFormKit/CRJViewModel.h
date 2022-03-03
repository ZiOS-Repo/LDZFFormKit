//
//  CRJViewModel.h
//  CRJFormKit_Example
//
// on 2020/11/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LDZFFormKit/LDZFFormKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CRJViewModel : NSObject
///数据源
@property(nonatomic, strong) NSMutableArray *dataArray;


///
@property(nonatomic, strong) FormAttrBean *FormAttrCellModel_;
@property(nonatomic, strong) FormBtnsBean *FormBtnsCellModel_;
@property(nonatomic, strong) FormCenterBtnBean *FormCenterBtnCellModel_;
@property(nonatomic, strong) FormCommonBean *FormCommonCellModel_;
@property(nonatomic, strong) FormKVBean *FormKVCellModel_;
@property(nonatomic, strong) FormKVMutiLineBean *FormKVMutiLineCellModel_;
@property(nonatomic, strong) FormPickerBean *FormPickerCellModel_;
@property(nonatomic, strong) FormPlusReduceBean *FormPlusReduceCellModel_;
@property(nonatomic, strong) FormSliderBean *FormSliderCellModel_;
@property(nonatomic, strong) FormSwitchBean *FormSwitchCellModel_;
@property(nonatomic, strong) FormTextfiledBean *FormTextfiledCellModel_;
@property(nonatomic, strong) FormTextViewBean *FormTextViewCellModel_;




@end

NS_ASSUME_NONNULL_END
