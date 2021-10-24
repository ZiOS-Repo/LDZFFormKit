//
//  CRJViewModel.m
//  CRJFormKit_Example
//
// on 2020/11/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJViewModel.h"

@implementation CRJViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        kFormConfig.bodyHeight = 50;
        
        [self initData];
    }
    return self;
}

- (void)initData {
    [self createSectionCarInfo];
    [self createSectionSystemFontInfo];
}

- (void)createSectionCarInfo {
    FormBaseSection *formSection = [[FormBaseSection alloc] init];
    formSection.headerInfo.hfData = @"组头";
    formSection.headerInfo.hfHeight = 30.f;
    formSection.headerInfo.hfClass = @"FormBaseSectionHFView";
    formSection.headerInfo.hfIdentifier = @"FormBaseSectionHFView__";
    
    formSection.footerInfo.hfData = @"组尾";
    formSection.footerInfo.hfHeight = 30.f;
    formSection.footerInfo.hfClass = @"FormBaseSectionHFView";
    formSection.footerInfo.hfIdentifier = @"FormBaseSectionHFView__";

    
    //
    _FormAttrCellModel_ = [[FormAttrCellModel alloc] init];
    _FormAttrCellModel_.val = [[NSAttributedString alloc] initWithString:@"FormAttr"];
    [formSection.cellDatas addObject:_FormAttrCellModel_];
    //
    _FormBtnsCellModel_ = [[FormBtnsCellModel alloc] init];
    _FormBtnsCellModel_.key = @"FormBtns";
    _FormBtnsCellModel_.val = @"男";
    _FormBtnsCellModel_.choices = @[@"男",@"女"];
    [formSection.cellDatas addObject:_FormBtnsCellModel_];
    //
    _FormCenterBtnCellModel_ = [[FormCenterBtnCellModel alloc] init];
    _FormCenterBtnCellModel_.val = @"FormCenterBtn";
    [formSection.cellDatas addObject:_FormCenterBtnCellModel_];
    //
    _FormCommonCellModel_ = [[FormCommonCellModel alloc] init];
    _FormCommonCellModel_.key = @"FormCommon";
    [formSection.cellDatas addObject:_FormCommonCellModel_];
    //
    _FormKVCellModel_ = [[FormKVCellModel alloc] init];
    _FormKVCellModel_.key = @"FormKV";
    _FormKVCellModel_.val = @"FormKV";
    [formSection.cellDatas addObject:_FormKVCellModel_];
    //
    {
        NSAttributedString *attr1 = [FormKVMutiLineCellModel attrByText:@"飞机" font:[UIFont italicSystemFontOfSize:15] color:[UIColor redColor]];
        NSAttributedString *attr2 = [FormKVMutiLineCellModel attrByText:@"飞机涉及哦啊见覅偶见附件四OA" font:[UIFont italicSystemFontOfSize:15] color:[UIColor redColor]];
        _FormKVMutiLineCellModel_ = [[FormKVMutiLineCellModel alloc] init];
        _FormKVMutiLineCellModel_.key = attr1;
        _FormKVMutiLineCellModel_.val = attr2;
        [_FormKVMutiLineCellModel_ updateBodyHeight];
        [formSection.cellDatas addObject:_FormKVMutiLineCellModel_];
    }
    //
    _FormPickerCellModel_ = [[FormPickerCellModel alloc] init];
    _FormPickerCellModel_.key = @"FormPicker";
    [formSection.cellDatas addObject:_FormPickerCellModel_];
    //
    _FormPlusReduceCellModel_ = [[FormPlusReduceCellModel alloc] init];
    _FormPlusReduceCellModel_.key = @"FormPlusReduce";
    [formSection.cellDatas addObject:_FormPlusReduceCellModel_];
    //
    _FormSliderCellModel_ = [[FormSliderCellModel alloc] init];
    _FormSliderCellModel_.key = @"FormSlider";
    _FormSliderCellModel_.value = 54;
    [formSection.cellDatas addObject:_FormSliderCellModel_];
    //
    _FormSwitchCellModel_ = [[FormSwitchCellModel alloc] init];
    _FormSwitchCellModel_.key = @"FormSwitch";
    [formSection.cellDatas addObject:_FormSwitchCellModel_];
    //
    _FormTextfiledCellModel_ = [[FormTextfiledCellModel alloc] init];
    _FormTextfiledCellModel_.key = @"FormTextfiled";
    [formSection.cellDatas addObject:_FormTextfiledCellModel_];
    //
    _FormTextViewCellModel_ = [[FormTextViewCellModel alloc] init];
    [formSection.cellDatas addObject:_FormTextViewCellModel_];

    [self.dataArray addObject:formSection];
}


- (void)createSectionSystemFontInfo {
    FormBaseSection *formSection = [[FormBaseSection alloc] init];
    formSection.headerInfo.hfData = @"系统字体";
    formSection.headerInfo.hfHeight = 30.f;
    formSection.headerInfo.hfClass = @"FormBaseSectionHFView";
    formSection.headerInfo.hfIdentifier = @"FormBaseSectionHFView__";
    
    NSArray *fontFamilyArray = [UIFont familyNames];
    for (NSString* familyName in fontFamilyArray) {
        NSArray *fontArray = [UIFont fontNamesForFamilyName:familyName];
     
        FormCommonCellModel *commonModel = [[FormCommonCellModel alloc] init];
        commonModel.key = familyName;
        commonModel.bodyColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        [formSection.cellDatas addObject:commonModel];

        for (NSString *fontName in fontArray) {
            FormCommonCellModel *commonModel = [[FormCommonCellModel alloc] init];
            commonModel.key = fontName;
            commonModel.keyFont = [UIFont fontWithName:fontName size:15];
            commonModel.keyMaxWidth = FORM_ScreenWidth - commonModel.bodyPadding.left - commonModel.bodyPadding.right;
            [formSection.cellDatas addObject:commonModel];
        }
    }
    [self.dataArray addObject:formSection];
}





#pragma mark - 懒加载
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
