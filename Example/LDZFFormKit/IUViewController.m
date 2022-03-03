//
//  IUViewController.m
//  IU_FormKit
//
//  Created by zhuyuhui434@gmail.com on 06/12/2021.
//  Copyright (c) 2021 zhuyuhui434@gmail.com. All rights reserved.
//

#import "IUViewController.h"
#import <Masonry/Masonry.h>
#import "CRJViewModel.h"
#import <LDZFAlertDialog/AlertDateDialog.h>
@interface IUViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
FormCellDelegate,
AlertBaseDialogDelegate
>
@property (nonatomic, strong) CRJViewModel *viewModel;
@property (nonatomic, assign) BOOL previousNaviBarShow;
@end

@implementation IUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}
    
#pragma mark - bindViewModel
- (void)bindViewModel {
    
    
}



#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FormBaseSection *formSection = self.viewModel.dataArray[section];
    return formSection.cellDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:indexPath.section];
    FormBaseCellModel *formCellData = [formSection.cellDatas objectAtIndex:indexPath.row];

    FormBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:formCellData.Identifier];
    if (!cell) {
        cell = [[NSClassFromString(formCellData.cellClass) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:formCellData.Identifier];
    }
    cell.formDelegate = self;
    cell.indexPath = indexPath;
    cell.tableView = tableView;
    cell.data = formCellData;
    [cell loadContent];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:indexPath.section];
    FormBaseCellModel *formCellData = [formSection.cellDatas objectAtIndex:indexPath.row];
    return formCellData.cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
    if (formSection.headerInfo.hfHeight > 0 &&
        formSection.headerInfo.hfClass &&
        formSection.headerInfo.hfIdentifier) {
        UITableViewHeaderFooterView *hfView = [formSection dequeueReusableHeaderFooterViewWithtableView:tableView];

        if ([hfView isKindOfClass:FormBaseSectionHFView.class]) {
            FormBaseSectionHFView *ppthfView = (FormBaseSectionHFView *)hfView;
            ppthfView.data = formSection.headerInfo;
            ppthfView.section = section;
            ppthfView.tableView = tableView;
            ppthfView.controller = self;
            [ppthfView loadContent];
        }
        return hfView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
    return formSection.headerInfo.hfHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
    if (formSection.footerInfo.hfHeight > 0 &&
        formSection.footerInfo.hfClass &&
        formSection.footerInfo.hfIdentifier) {
        UITableViewHeaderFooterView *hfView = [formSection dequeueReusableHeaderFooterViewWithtableView:tableView];

        if ([hfView isKindOfClass:FormBaseSectionHFView.class]) {
            FormBaseSectionHFView *ppthfView = (FormBaseSectionHFView *)hfView;
            ppthfView.data = formSection.footerInfo;
            ppthfView.section = section;
            ppthfView.tableView = tableView;
            ppthfView.controller = self;
            [ppthfView loadContent];
        }
        return hfView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
    return formSection.footerInfo.hfHeight;
}

#pragma mark - FormCellDelegate
- (void)formCell:(FormBaseCell *)cell event:(id)event {
    AlertDateDialog *dialog = AlertDateDialog.build;
    dialog.withInfo(@"请选择-开始时间");
    dialog.withObject(cell.data);
    dialog.withDelegate(self).prepareFinish();
    [self presentViewController:dialog animated:NO completion:nil];
}
#pragma mark - FormBtnsCellDelegate
- (void)formBtnsCellOfValueChanged:(FormBtnsCell *)cell bean:(FormBtnsBean *)bean {
    
}
#pragma mark - FormPlusReduceCellDelegate
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean clickPlusBtn:(UIButton *)sender {}
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean clickReduceBtn:(UIButton *)sender {}
- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean textFieldDidChange:(UITextField *)textField {
    
}
#pragma mark - FormSliderCellDelegate
- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean clickAreaBtn:(UIButton *)sender {
    FormSliderBean *dataItem = cell.data;
    dataItem.expend = !dataItem.expend;
    if (cell.indexPath) {
        [UIView performWithoutAnimation:^{
            [self.recylerView reloadRowsAtIndexPaths:@[cell.indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }
}

- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean sliderValueDidChanged:(UISlider *)sender {
    FormSliderBean *dataItem = cell.data;
    ///取整
    int discreteValue = roundl([sender value]); // Rounds float to an integer
    discreteValue = discreteValue / 10 * 10;
    [sender setValue:(float)discreteValue]; // Sets your slider to this value
    
    dataItem.value = sender.value;
    cell.valLable.text = [NSString stringWithFormat:@"%.f%%",dataItem.value];
}

- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean sliderEnd:(UISlider *)sender {
    NSLog(@"停止");
}
#pragma mark - FormSwitchCellDelegate
- (void)switchCellOfValueChanged:(FormSwitchCell *)cell bean:(FormSwitchBean *)bean{

}

#pragma mark - FormTextfiledCellDelegate
- (void)textfiledCell:(FormTextfiledCell *)cell textFieldDidChange:(UITextField *)textField {
    FormTextfiledBean *dataItem = cell.data;
    dataItem.val = textField.text;
}

#pragma mark - FormTextViewCellDelegate
- (void)textViewCell:(FormTextViewCell *)cell textViewDidChange:(YYTextView *)textView {
    FormTextViewBean *dataItem = cell.data;
    dataItem.val = textView.text;
}


#pragma mark - AlertBaseDialogDelegate
- (void)baseDialog:(AlertBaseDialog *)dialog didSelectedItems:(NSArray *)items {
    if ([dialog.object isKindOfClass:FormBaseCellModel.class]) {
        if ([dialog.object isKindOfClass:FormPickerBean.class]) {
            FormPickerBean *formCellData = dialog.object;
            formCellData.val = [NSString stringWithFormat:@"%@",items.firstObject];
            [self.recylerView reloadData];
        }
    }
}





#pragma mark - 懒加载
- (CRJViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[CRJViewModel alloc] init];
    }
    return _viewModel;
}

@end

