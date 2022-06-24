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
#import <LDZFFormKit/QnmFormUIManagementHeader.h>
#import "FormUIManagement.h"
#import "FormUIMAdapter.h"

@interface IUViewController ()
@property(nonatomic, strong) FormUIMAdapter *tableAdapter;
@end

@implementation IUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ldzfInitSubviews];
    [self bindViewModel];
}
    
- (void)ldzfInitSubviews {
    [self createTableViewWithStyle:UITableViewStylePlain];
}


- (void)createTableViewWithStyle:(UITableViewStyle)style {
    [self createTableViewWithFrame:self.view.bounds style:style];
}

- (void)createTableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self createTableView:UITableView.class withFrame:frame style:style];
}

- (void)createTableView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    [self.recylerView removeFromSuperview];
    self.recylerView = nil;
    self.recylerView = [self preferredRecylerView:viewClass withFrame:frame style:style];
    [self.view addSubview:self.recylerView];
    [self.recylerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.recylerView.superview);
    }];
}

#pragma mark - getter
- (UITableView *)preferredRecylerView:(Class)viewClass withFrame:(CGRect)frame style:(UITableViewStyle)style {
    UITableView *recylerView = [[viewClass alloc] initWithFrame:frame style:style];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.separatorStyle = UITableViewCellSeparatorStyleNone;
    recylerView.showsVerticalScrollIndicator = NO;
    recylerView.showsHorizontalScrollIndicator = NO;
    return recylerView;
}

#pragma mark - bindViewModel
- (void)bindViewModel {
    NSDictionary *dic = [self readLocalFileWithName:@"QnmFormTemplates"];
    QnmFormUIModel *model = [QnmFormUIModel yy_modelWithDictionary:dic];
    
    self.recylerView.delegate = self.tableAdapter;
    self.recylerView.dataSource = self.tableAdapter;
    [self.tableAdapter setDataModel:model forTableView:self.recylerView];
}


- (FormUIMAdapter *)tableAdapter {
    if (!_tableAdapter) {
        _tableAdapter = [[FormUIMAdapter alloc] initWithManagerClass:FormUIManagement.class];
    }
    return _tableAdapter;
}

// 读取本地JSON文件
- (id)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}

//
//
//
//#pragma mark - UITableViewDelegate,UITableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.viewModel.dataArray.count;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    FormBaseSection *formSection = self.viewModel.dataArray[section];
//    return formSection.cellDatas.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:indexPath.section];
//    FormBaseCellModel *formCellData = [formSection.cellDatas objectAtIndex:indexPath.row];
//
//    FormBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:formCellData.Identifier];
//    if (!cell) {
//        cell = [[NSClassFromString(formCellData.cellClass) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:formCellData.Identifier];
//    }
//    cell.formDelegate = self;
//    cell.indexPath = indexPath;
//    cell.tableView = tableView;
//    cell.data = formCellData;
//    [cell loadContent];
//    return cell;
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:indexPath.section];
//    FormBaseCellModel *formCellData = [formSection.cellDatas objectAtIndex:indexPath.row];
//    return formCellData.cellHeight;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
//    if (formSection.headerInfo.hfHeight > 0 &&
//        formSection.headerInfo.hfClass &&
//        formSection.headerInfo.hfIdentifier) {
//        UITableViewHeaderFooterView *hfView = [formSection dequeueReusableHeaderFooterViewWithtableView:tableView];
//
//        if ([hfView isKindOfClass:FormBaseSectionHFView.class]) {
//            FormBaseSectionHFView *ppthfView = (FormBaseSectionHFView *)hfView;
//            ppthfView.data = formSection.headerInfo;
//            ppthfView.section = section;
//            ppthfView.tableView = tableView;
//            ppthfView.controller = self;
//            [ppthfView loadContent];
//        }
//        return hfView;
//    }
//    return nil;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
//    return formSection.headerInfo.hfHeight;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
//    if (formSection.footerInfo.hfHeight > 0 &&
//        formSection.footerInfo.hfClass &&
//        formSection.footerInfo.hfIdentifier) {
//        UITableViewHeaderFooterView *hfView = [formSection dequeueReusableHeaderFooterViewWithtableView:tableView];
//
//        if ([hfView isKindOfClass:FormBaseSectionHFView.class]) {
//            FormBaseSectionHFView *ppthfView = (FormBaseSectionHFView *)hfView;
//            ppthfView.data = formSection.footerInfo;
//            ppthfView.section = section;
//            ppthfView.tableView = tableView;
//            ppthfView.controller = self;
//            [ppthfView loadContent];
//        }
//        return hfView;
//    }
//    return nil;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    FormBaseSection *formSection = [self.viewModel.dataArray objectAtIndex:section];
//    return formSection.footerInfo.hfHeight;
//}
//
//#pragma mark - FormCellDelegate
//- (void)formCell:(FormBaseCell *)cell event:(id)event {
//    AlertDateDialog *dialog = AlertDateDialog.build;
//    dialog.withInfo(@"请选择-开始时间");
//    dialog.withObject(cell.data);
//    [dialog setDidSelectedItems:^(AlertDateDialog * _Nonnull dialog, NSArray * _Nonnull items) {
//        if ([dialog.object isKindOfClass:FormPickerBean.class]) {
//            FormPickerBean *formCellData = dialog.object;
//            formCellData.val = [NSString stringWithFormat:@"%@",items.firstObject];
//            [self.recylerView reloadData];
//        }
//    }];
//    [self presentViewController:dialog animated:NO completion:nil];
//}
//#pragma mark - FormBtnsCellDelegate
//- (void)formBtnsCellOfValueChanged:(FormBtnsCell *)cell bean:(FormBtnsBean *)bean {
//
//}
//#pragma mark - FormPlusReduceCellDelegate
//- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean clickPlusBtn:(UIButton *)sender {}
//- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean clickReduceBtn:(UIButton *)sender {}
//- (void)plusReduceCell:(FormPlusReduceCell *)cell bean:(FormPlusReduceBean *)bean textFieldDidChange:(UITextField *)textField {
//
//}
//#pragma mark - FormSliderCellDelegate
//- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean clickAreaBtn:(UIButton *)sender {
//    FormSliderBean *dataItem = cell.data;
//    dataItem.expend = !dataItem.expend;
//    if (cell.indexPath) {
//        [UIView performWithoutAnimation:^{
//            [self.recylerView reloadRowsAtIndexPaths:@[cell.indexPath] withRowAnimation:UITableViewRowAnimationNone];
//        }];
//    }
//}
//
//- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean sliderValueDidChanged:(UISlider *)sender {
//    FormSliderBean *dataItem = cell.data;
//    ///取整
//    int discreteValue = roundl([sender value]); // Rounds float to an integer
//    discreteValue = discreteValue / 10 * 10;
//    [sender setValue:(float)discreteValue]; // Sets your slider to this value
//
//    dataItem.value = sender.value;
//    cell.valLable.text = [NSString stringWithFormat:@"%.f%%",dataItem.value];
//}
//
//- (void)sliderCell:(FormSliderCell *)cell bean:(FormSliderBean *)bean sliderEnd:(UISlider *)sender {
//    NSLog(@"停止");
//}
//#pragma mark - FormSwitchCellDelegate
//- (void)switchCellOfValueChanged:(FormSwitchCell *)cell bean:(FormSwitchBean *)bean{
//
//}
//
//#pragma mark - FormTextfiledCellDelegate
//- (void)textfiledCell:(FormTextfiledCell *)cell textFieldDidChange:(UITextField *)textField {
//    FormTextfiledBean *dataItem = cell.data;
//    dataItem.val = textField.text;
//}
//
//#pragma mark - FormTextViewCellDelegate
//- (void)textViewCell:(FormTextViewCell *)cell textViewDidChange:(YYTextView *)textView {
//    FormTextViewBean *dataItem = cell.data;
//    dataItem.val = textView.text;
//}
//




//#pragma mark - 懒加载
//- (CRJViewModel *)viewModel {
//    if (!_viewModel) {
//        _viewModel = [[CRJViewModel alloc] init];
//    }
//    return _viewModel;
//}

@end

