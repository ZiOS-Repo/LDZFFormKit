//
//  QnmFormTextfiledCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmFormTextfiledCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"

@interface QnmFormTextfiledCell()<UITextFieldDelegate>
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UITextField *valTextfiled;

@end

@implementation QnmFormTextfiledCell
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
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.superview).offset(15);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
    [self.valTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.top.bottom.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.valTextfiled.superview).offset(150);
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
    self.valTextfiled.text = model.valueScheme.value;
    self.valTextfiled.placeholder   = model.valueScheme.placeholder;
    self.valTextfiled.font          = model.uiScheme.qnm_textfiledIN.qnm_font;
    self.valTextfiled.textColor     = model.uiScheme.qnm_textfiledIN.qnm_color;
    self.valTextfiled.keyboardType  = model.uiScheme.qnm_textfiledIN.qnm_keyboardType;
    self.valTextfiled.returnKeyType = model.uiScheme.qnm_textfiledIN.qnm_returnKeyType;
    self.valTextfiled.enabled       = model.uiScheme.qnm_editable;
    [self.valTextfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-model.uiScheme.qnm_paddingRight);
        make.top.bottom.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
    }];
}


#pragma mark - UITextFieldDelegate
- (void)textFieldDidChange:(UITextField *)textField {
    self.holdModel.valueScheme.value = textField.text;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

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
        _valTextfiled.textAlignment = NSTextAlignmentRight;
        [_valTextfiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _valTextfiled;
}




@end
