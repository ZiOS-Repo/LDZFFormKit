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
@property(nonatomic, strong) FormAttrCellModel *FormAttrCellModel_;
@property(nonatomic, strong) FormBtnsCellModel *FormBtnsCellModel_;
@property(nonatomic, strong) FormCenterBtnCellModel *FormCenterBtnCellModel_;
@property(nonatomic, strong) FormCommonCellModel *FormCommonCellModel_;
@property(nonatomic, strong) FormKVCellModel *FormKVCellModel_;
@property(nonatomic, strong) FormKVMutiLineCellModel *FormKVMutiLineCellModel_;
@property(nonatomic, strong) FormPickerCellModel *FormPickerCellModel_;
@property(nonatomic, strong) FormPlusReduceCellModel *FormPlusReduceCellModel_;
@property(nonatomic, strong) FormSliderCellModel *FormSliderCellModel_;
@property(nonatomic, strong) FormSwitchCellModel *FormSwitchCellModel_;
@property(nonatomic, strong) FormTextfiledCellModel *FormTextfiledCellModel_;
@property(nonatomic, strong) FormTextViewCellModel *FormTextViewCellModel_;




@end

NS_ASSUME_NONNULL_END
