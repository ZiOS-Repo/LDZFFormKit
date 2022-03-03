//
//  FormBaseCell.m
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import "FormBaseCell.h"

@interface FormBaseCell()
@property(nonatomic, strong) FormBaseCellModel *dataItem;
@end

@implementation FormBaseCell

- (void)buildSubview {
    [super buildSubview];
    [self.contentView addSubview:self.headerView];
    [self.contentView addSubview:self.bodyView];
    [self.contentView addSubview:self.footerView];
    [self.bodyView addSubview:self.separator];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.separator.superview).offset(18);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)loadContent {
    if (![self.data isKindOfClass:[FormBaseCellModel class]]) return;
    if (FormManager.shared.showDebugLine) {
        [self showDebugLine];
    }
    if (self.tableView) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    self.dataItem = self.data;

    self.headerView.backgroundColor = self.dataItem.headerColor;
    self.bodyView.backgroundColor = self.dataItem.bodyColor;
    self.footerView.backgroundColor = self.dataItem.footerColor;
    self.separator.backgroundColor = self.dataItem.separatorColor;
    self.separator.hidden = self.dataItem.separatorHide;
    [self.separator mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.separator.superview).offset(self.dataItem.separatorMargin.left);
        make.right.equalTo(self.separator.superview).offset(-self.dataItem.separatorMargin.right);
        make.bottom.equalTo(self.separator.superview).offset(0);
        make.height.mas_equalTo(self.dataItem.separatorHeight);
    }];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.headerView.frame = CGRectMake(0, 0, self.width, self.dataItem.headerHeight);
    self.bodyView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), self.width, self.dataItem.bodyHeight);
    self.footerView.frame = CGRectMake(0, CGRectGetMaxY(self.bodyView.frame), self.width, self.dataItem.footerHeight);
}

- (void)showDebugLine {}

#pragma mark - 懒加载
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _headerView;
}

- (UIView *)footerView {
    if (!_footerView) {
        _footerView = [[UIView alloc] init];
        _footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _footerView;
}

- (UIView *)bodyView {
    if (!_bodyView) {
        _bodyView = [[UIView alloc] init];
        _bodyView.backgroundColor = [UIColor whiteColor];
    }
    return _bodyView;
}

- (UIView *)separator {
    if (!_separator) {
        _separator = [[UIView alloc] init];
        _separator.backgroundColor = [UIColor groupTableViewBackgroundColor];;
    }
    return _separator;
}
@end
