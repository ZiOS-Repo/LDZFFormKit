//
//  FormSwitchCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormSwitchCell.h"
@interface FormSwitchCell()
@property(nonatomic, strong) UISwitch *valSwitch;
@property(nonatomic, strong) FormSwitchBean *dataItem;
@end
@implementation FormSwitchCell


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
    [self.bodyView addSubview:self.valSwitch];
    [self.valSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valSwitch.superview).offset(-18);
        make.centerY.equalTo(self.valSwitch.superview).offset(0);
    }];
}

- (void)loadContent {
    [super loadContent];
    if (![self.data isKindOfClass:[FormSwitchBean class]]) return;
    
    self.dataItem = self.data;
    self.valSwitch.on = self.dataItem.on;
    self.valSwitch.enabled = self.dataItem.enable;

    [self.valSwitch mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valSwitch.superview).offset(-self.dataItem.bodyPadding.right);
        make.centerY.equalTo(self.valSwitch.superview).offset(0);
    }];

}

- (void)switchValueChanged: (id)sender{
    UISwitch *whichSwitch = (UISwitch *)sender;
    whichSwitch.on = whichSwitch.isOn;
    
    self.dataItem.on = whichSwitch.isOn;
    if ([self.formDelegate respondsToSelector:@selector(switchCellOfValueChanged:bean:)]) {
        [self.formDelegate switchCellOfValueChanged:self bean:self.dataItem];
    }
}
#pragma mark - 懒加载
- (UISwitch *)valSwitch {
    if (!_valSwitch) {
        _valSwitch = [[UISwitch alloc] init];
        [_valSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _valSwitch;
}

@end
