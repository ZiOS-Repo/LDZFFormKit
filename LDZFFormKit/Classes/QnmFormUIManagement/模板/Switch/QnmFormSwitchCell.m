//
//  QnmFormSwitchCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmFormSwitchCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"

@interface QnmFormSwitchCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UISwitch *valSwitch;
@end

@implementation QnmFormSwitchCell
#pragma mark - init & dealloc
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupDefaultSubViews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setupDefaultSubViews {
    [self.contentView addSubview:self.keyLable];
    [self.contentView addSubview:self.valSwitch];
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.superview).offset(15);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
    [self.valSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valSwitch.superview).offset(-18);
        make.centerY.equalTo(self.valSwitch.superview).offset(0);
    }];
}


#pragma mark - configure
- (void)configureWithModel:(QnmFormItemModel *)model {
    [super configureWithModel:model];
    [self keyInfoWithModel:model];
    [self valueInfoWithModel:model];
}

- (void)keyInfoWithModel:(QnmFormItemModel *)model {
    [self layoutIfNeeded];
    self.keyLable.font      = model.uiScheme.qnm_titleIN.qnm_font;
    self.keyLable.textColor = model.uiScheme.qnm_titleIN.qnm_color;
    self.keyLable.text      = model.valueScheme.title;
    [self.keyLable sizeToFit];
    CGFloat widthRatio = model.uiScheme.qnm_titleIN.qnm_widthRatio;
    CGFloat titleMaxWidth = (self.width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(model.uiScheme.qnm_paddingLeft);
        make.centerY.equalTo(self.contentView).offset(0);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.width));
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valSwitch.on = [model.valueScheme.value isEqualToString:@"1"];
    self.valSwitch.enabled = model.uiScheme.qnm_editable;
    [self.valSwitch mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-model.uiScheme.qnm_paddingRight);
        make.centerY.equalTo(self.contentView).offset(0);
    }];
}

- (void)switchValueChanged: (id)sender{
    UISwitch *whichSwitch = (UISwitch *)sender;
    whichSwitch.on = whichSwitch.isOn;
    self.holdModel.valueScheme.value = whichSwitch.isOn ? @"1":@"0";
//    if ([self.formDelegate respondsToSelector:@selector(switchCellOfValueChanged:bean:)]) {
//        [self.formDelegate switchCellOfValueChanged:self bean:self.dataItem];
//    }
}

#pragma mark - 懒加载
- (UILabel *)keyLable {
    if (_keyLable == nil) {
        _keyLable = [[UILabel alloc] init];
        _keyLable.textAlignment = NSTextAlignmentLeft;
    }
    return _keyLable;
}

- (UISwitch *)valSwitch {
    if (!_valSwitch) {
        _valSwitch = [[UISwitch alloc] init];
        [_valSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _valSwitch;
}



@end
