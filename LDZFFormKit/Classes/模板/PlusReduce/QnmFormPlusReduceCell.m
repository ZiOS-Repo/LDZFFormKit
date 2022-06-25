//
//  QnmFormPlusReduceCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/25.
//

#import "QnmFormPlusReduceCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
@interface QnmFormPlusReduceCell()<UITextFieldDelegate>
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UITextField *valTextfiled;
@property(nonatomic, strong) UIButton *reduceBtn;
@property(nonatomic, strong) UIButton *plusBtn;
@end

@implementation QnmFormPlusReduceCell

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
    [self.contentView addSubview:self.valTextfiled];
    [self.contentView addSubview:self.reduceBtn];
    [self.contentView addSubview:self.plusBtn];
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    [self.plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-18);
        make.centerY.mas_offset(0);
    }];
    [self.valTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.mas_left).offset(-8);
        make.width.mas_greaterThanOrEqualTo(50);
        make.centerY.mas_offset(0);
    }];
    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valTextfiled.mas_left).offset(-8);
        make.centerY.mas_offset(0);
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
    self.keyLable.font      = model.uiScheme.titleIN.qnm_font;
    self.keyLable.textColor = model.uiScheme.titleIN.qnm_color;
    self.keyLable.text      = model.valueScheme.title;
    [self.keyLable sizeToFit];
    CGFloat widthRatio = model.uiScheme.titleIN.qnm_widthRatio;
    CGFloat titleMaxWidth = (self.qmui_width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.qmui_width));
        make.centerY.mas_offset(0);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valTextfiled.text = model.valueScheme.value;
    self.valTextfiled.attributedPlaceholder = [[NSAttributedString alloc] initWithString:safeString(model.valueScheme.placeholder) attributes:@{NSForegroundColorAttributeName:model.uiScheme.plusReduceIN.qnm_placeholderTextColor,NSFontAttributeName:model.uiScheme.plusReduceIN.qnm_placeholderFont}];
    self.valTextfiled.font          = model.uiScheme.plusReduceIN.qnm_font;
    self.valTextfiled.textColor     = model.uiScheme.plusReduceIN.qnm_color;
    self.valTextfiled.keyboardType  = model.uiScheme.plusReduceIN.qnm_keyboardType;
    self.valTextfiled.returnKeyType = model.uiScheme.plusReduceIN.qnm_returnKeyType;
    self.valTextfiled.enabled       = model.uiScheme.qnm_editable;
    [self.valTextfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.mas_right).offset(10);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
        make.top.bottom.mas_offset(0);
    }];

        
    self.reduceBtn.enabled  = model.uiScheme.plusReduceIN.qnm_reduceEnable;
    self.plusBtn.enabled    = model.uiScheme.plusReduceIN.qnm_plusEnable;
    [self.plusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.plusBtn.superview).offset(0);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
    }];
    [self.valTextfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.mas_left).offset(-8);
        make.width.mas_greaterThanOrEqualTo(model.uiScheme.plusReduceIN.qnm_inputBoxWidth);
        make.centerY.equalTo(self.valTextfiled.superview).offset(0);
    }];

}


#pragma mark - 事件
- (void)clickBtns:(UIButton *)sender {
    NSString *value = self.holdModel.valueScheme.value;
    NSInteger minimum = NSIntegerMin;
    NSInteger maximum = NSIntegerMax;
    if (!isStringEmptyOrNil(self.holdModel.valueScheme.minimum) && self.holdModel.valueScheme.minimum.integerValue >= NSIntegerMin) {
        minimum = self.holdModel.valueScheme.minimum.integerValue;
    }
    if (!isStringEmptyOrNil(self.holdModel.valueScheme.maximum) && self.holdModel.valueScheme.maximum.integerValue <= NSIntegerMax) {
        maximum = self.holdModel.valueScheme.maximum.integerValue;
    }
    if ([sender isEqual:self.reduceBtn]) {
        if (value.integerValue - 1 >= minimum) {
            self.holdModel.valueScheme.value = [NSString stringWithFormat:@"%ld",value.integerValue - 1];
            if (self.reloadOperation) {
                self.reloadOperation(1, self);
            }
        }
    }
    else if ([sender isEqual:self.plusBtn]) {
        if (value.integerValue + 1 <= maximum) {
            self.holdModel.valueScheme.value = [NSString stringWithFormat:@"%ld",value.integerValue + 1];
            if (self.reloadOperation) {
                self.reloadOperation(1, self);
            }
        }
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidChange:(UITextField *)textField {
    NSInteger minimum = NSIntegerMin;
    NSInteger maximum = NSIntegerMax;
    if (!isStringEmptyOrNil(self.holdModel.valueScheme.minimum) && self.holdModel.valueScheme.minimum.integerValue >= NSIntegerMin) {
        minimum = self.holdModel.valueScheme.minimum.integerValue;
    }
    if (!isStringEmptyOrNil(self.holdModel.valueScheme.maximum) && self.holdModel.valueScheme.maximum.integerValue <= NSIntegerMax) {
        maximum = self.holdModel.valueScheme.maximum.integerValue;
    }
    if (textField.text.integerValue >= minimum && textField.text.integerValue <= maximum) {
        self.holdModel.valueScheme.value = [NSString stringWithFormat:@"%ld",textField.text.integerValue ];
        if (self.reloadOperation) {
            self.reloadOperation(1, self);
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSInteger minimum = NSIntegerMin;
    NSInteger maximum = NSIntegerMax;
    if (!isStringEmptyOrNil(self.holdModel.valueScheme.minimum) && self.holdModel.valueScheme.minimum.integerValue >= NSIntegerMin) {
        minimum = self.holdModel.valueScheme.minimum.integerValue;
    }
    if (!isStringEmptyOrNil(self.holdModel.valueScheme.maximum) && self.holdModel.valueScheme.maximum.integerValue <= NSIntegerMax) {
        maximum = self.holdModel.valueScheme.maximum.integerValue;
    }
    if (textField.text.integerValue >= minimum && textField.text.integerValue <= maximum) {
        self.holdModel.valueScheme.value = [NSString stringWithFormat:@"%ld",textField.text.integerValue ];
        if (self.reloadOperation) {
            self.reloadOperation(1, self);
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableDebugging = YES;
}


#pragma mark - 懒加载
- (UILabel *)keyLable {
    if (_keyLable == nil) {
        _keyLable = [[UILabel alloc] init];
        _keyLable.textAlignment = NSTextAlignmentLeft;
    }
    return _keyLable;
}

- (UITextField *)valTextfiled {
    if (!_valTextfiled) {
        _valTextfiled = [[UITextField alloc] init];
        _valTextfiled.delegate = self;
        _valTextfiled.placeholder = @"请输入";
        _valTextfiled.textAlignment = NSTextAlignmentCenter;
        [_valTextfiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _valTextfiled;
}


- (UIButton *)reduceBtn {
    if (!_reduceBtn) {
        _reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reduceBtn setImage:[self imageNamed:@"item_decrease"] forState:UIControlStateNormal];
        [_reduceBtn setImage:[self imageNamed:@"item_decrease_disable"] forState:UIControlStateDisabled];
        [_reduceBtn addTarget:self action:@selector(clickBtns:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reduceBtn;
}

- (UIButton *)plusBtn {
    if (!_plusBtn) {
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusBtn setImage:[self imageNamed:@"item_increase"] forState:UIControlStateNormal];
        [_plusBtn addTarget:self action:@selector(clickBtns:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusBtn;
}

@end
