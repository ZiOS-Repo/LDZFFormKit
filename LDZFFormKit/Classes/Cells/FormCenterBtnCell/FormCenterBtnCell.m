//
//  FormCenterBtnCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCenterBtnCell.h"
@interface FormCenterBtnCell ()
@property(nonatomic, strong) FormCenterBtnBean *dataItem;
@end
@implementation FormCenterBtnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)buildSubview {
    [super buildSubview];
    [self.bodyView addSubview:self.centerBtn];
    [self.centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.centerBtn.superview).offset(0);
    }];
}

- (void)loadContent {
    [super loadContent];
    if (![self.data isKindOfClass:[FormCenterBtnBean class]]) return;
    
    self.dataItem = self.data;
    _centerBtn.titleLabel.font = self.dataItem.valFont;
    [_centerBtn setTitle:self.dataItem.val forState:UIControlStateNormal];
    [_centerBtn setTitleColor:self.dataItem.valColor forState:UIControlStateNormal];
    [_centerBtn setImage:self.dataItem.image forState:UIControlStateNormal];
}

- (void)clickTapAreaBtn:(UIButton *)sender {
    [self.qnm_viewController.view endEditing:YES];
    if ([self.formDelegate respondsToSelector:@selector(formCell:event:)]) {
        [self.formDelegate formCell:self event:nil];
    }
}
#pragma mark - 懒加载
- (UIButton *)centerBtn {
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centerBtn addTarget:self action:@selector(clickTapAreaBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerBtn;
}

@end
