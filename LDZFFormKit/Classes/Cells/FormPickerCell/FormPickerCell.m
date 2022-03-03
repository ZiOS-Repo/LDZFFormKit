//
//  FormPickerCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormPickerCell.h"

@interface FormPickerCell()
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) UIImageView *extrImgView;
@property(nonatomic, strong) UIButton *tapAreaBtn;
@property(nonatomic, strong) FormPickerBean *dataItem;
@end
@implementation FormPickerCell

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
    [self.bodyView addSubview:self.extrImgView];
    [self.bodyView addSubview:self.valLable];
    [self.bodyView addSubview:self.tapAreaBtn];
    
    [self.extrImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrImgView.superview).offset(-18);
        make.centerY.equalTo(self.extrImgView.superview).offset(0);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrImgView.mas_left).offset(-8);
        make.centerY.equalTo(self.valLable.superview).offset(0);
        make.left.equalTo(self.valLable.superview).offset(150);
    }];
    [self.tapAreaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.valLable.mas_left).offset(0);
        make.right.equalTo(self.extrImgView.mas_right).offset(0);
        make.top.bottom.equalTo(self.tapAreaBtn.superview).offset(0);
    }];
}

- (void)loadContent {
    [super loadContent];
    if (![self.data isKindOfClass:[FormPickerBean class]]) return;
    self.dataItem = self.data;
    self.extrImgView.image = self.dataItem.extrImg;
    if (kfStringIsEmpty(self.dataItem.val)) {
        self.valLable.text = self.dataItem.placeholder;
        self.valLable.textColor = self.dataItem.placeholderColor;
    } else {
        self.valLable.text = self.dataItem.val;
        self.valLable.textColor = self.dataItem.valColor;
        if (!self.dataItem.enableEdit) {
            self.valLable.textColor = [self.dataItem.valColor colorWithAlphaComponent:0.7];
        }
    }
    
    [self.extrImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrImgView.superview).offset(-self.dataItem.bodyPadding.right);
        make.centerY.equalTo(self.extrImgView.superview).offset(0);
        if (self.extrImgView.image) {
            make.size.mas_equalTo(self.extrImgView.image.size);
        } else {
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }
    }];
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrImgView.mas_left).offset(-8);
        make.centerY.equalTo(self.valLable.superview).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
    }];

}

- (void)showDebugLine {
    [super showDebugLine];
    self.valLable.layer.borderColor = [UIColor greenColor].CGColor;
    self.valLable.layer.borderWidth = 1;

    self.tapAreaBtn.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.4];
}

- (void)clickTapAreaBtn:(UIButton *)sender {
    [self.qmui_viewController.view endEditing:YES];
    if ([self.formDelegate respondsToSelector:@selector(formCell:event:)]) {
        [self.formDelegate formCell:self event:nil];
    }
}

#pragma mark - 懒加载
- (UILabel *)valLable {
    if (!_valLable) {
        _valLable = [[UILabel alloc] init];
        _valLable.lineBreakMode = NSLineBreakByTruncatingTail;
        _valLable.textAlignment = NSTextAlignmentRight;
        _valLable.textColor = [UIColor blackColor];
        _valLable.numberOfLines = 2;
        _valLable.font = [UIFont systemFontOfSize:14];
    }
    return _valLable;
}

- (UIImageView *)extrImgView {
    if (!_extrImgView) {
        _extrImgView = [[UIImageView alloc] init];
    }
    return _extrImgView;
}

- (UIButton *)tapAreaBtn {
    if (!_tapAreaBtn) {
        _tapAreaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tapAreaBtn addTarget:self action:@selector(clickTapAreaBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapAreaBtn;
}
@end
