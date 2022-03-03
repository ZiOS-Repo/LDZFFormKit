//
//  FormPlusReduceCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormPlusReduceCell.h"
#import "IQKeyboardManager/IQKeyboardManager.h"
@interface FormPlusReduceCell()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *valTextfiled;
@property(nonatomic, strong) UIButton *reduceBtn;
@property(nonatomic, strong) UIButton *plusBtn;
@property(nonatomic, strong) FormPlusReduceBean *dataItem;
@end
@implementation FormPlusReduceCell


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
    
    [self.bodyView addSubview:self.plusBtn];
    [self.bodyView addSubview:self.valTextfiled];
    [self.bodyView addSubview:self.reduceBtn];

    [self.plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.superview).offset(-18);
        make.centerY.equalTo(self.plusBtn.superview).offset(0);
    }];
    [self.valTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.mas_left).offset(-8);
        make.centerY.equalTo(self.valTextfiled.superview).offset(0);
        make.width.mas_greaterThanOrEqualTo(50);
    }];
    
    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valTextfiled.mas_left).offset(-8);
        make.centerY.equalTo(self.reduceBtn.superview).offset(0);
    }];
}

- (void)loadContent {
    [super loadContent];
    if (![self.data isKindOfClass:[FormPlusReduceBean class]]) return;
    
    self.dataItem = self.data;
    self.valTextfiled.text = [NSString stringWithFormat:@"%ld",(long)self.dataItem.num];
    self.valTextfiled.enabled = self.dataItem.inputBoxEnableEdit;
    self.reduceBtn.enabled = self.dataItem.reduceEnable;
    self.plusBtn.enabled = self.dataItem.plusEnable;
    
    [self.reduceBtn setImage:self.dataItem.reduceImg_normal forState:UIControlStateNormal];
    [self.reduceBtn setImage:self.dataItem.reduceImg_disabled forState:UIControlStateDisabled];
    [self.plusBtn setImage:self.dataItem.plusImg_normal forState:UIControlStateNormal];
    
    [self.plusBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.superview).offset(-self.dataItem.bodyPadding.right);
        make.centerY.equalTo(self.plusBtn.superview).offset(0);
    }];
    [self.valTextfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.mas_left).offset(-8);
        make.centerY.equalTo(self.valTextfiled.superview).offset(0);
        make.width.mas_greaterThanOrEqualTo(self.dataItem.inputBoxWidth);
    }];

}

- (void)showDebugLine {
    [super showDebugLine];
    self.plusBtn.layer.borderColor = [UIColor greenColor].CGColor;
    self.plusBtn.layer.borderWidth = 1;
    
    self.valTextfiled.layer.borderColor = [UIColor greenColor].CGColor;
    self.valTextfiled.layer.borderWidth = 1;
    
    self.reduceBtn.layer.borderColor = [UIColor greenColor].CGColor;
    self.reduceBtn.layer.borderWidth = 1;
}


#pragma mark - 事件
- (void)clickBtns:(UIButton *)sender {
    if ([sender isEqual:self.reduceBtn]) {
        if ([self.formDelegate respondsToSelector:@selector(plusReduceCell:bean:clickReduceBtn:)]) {
            [self.formDelegate plusReduceCell:self bean:self.dataItem clickReduceBtn:sender];
        }
    }
    else if ([sender isEqual:self.plusBtn]) {
        if ([self.formDelegate respondsToSelector:@selector(plusReduceCell:bean:clickPlusBtn:)]) {
            [self.formDelegate plusReduceCell:self bean:self.dataItem clickPlusBtn:sender];
        }
    }
}

#pragma mark--- textFieldDidChange
- (void)textFieldDidChange:(UITextField *)textField {
    if ([self.formDelegate respondsToSelector:@selector(plusReduceCell:bean:textFieldDidChange:)]) {
        [self.formDelegate plusReduceCell:self bean:self.dataItem textFieldDidChange:textField];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([self.formDelegate respondsToSelector:@selector(plusReduceCell:bean:textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.formDelegate plusReduceCell:self bean:self.dataItem textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.formDelegate respondsToSelector:@selector(plusReduceCell:bean:textFieldDidEndEditing:)]) {
        [self.formDelegate plusReduceCell:self bean:self.dataItem textFieldDidEndEditing:textField];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableDebugging = YES;
}


#pragma mark - 懒加载
- (UITextField *)valTextfiled {
    if (!_valTextfiled) {
        _valTextfiled = [[UITextField alloc] init];
        _valTextfiled.delegate = self;
        _valTextfiled.placeholder = @"请输入";
        _valTextfiled.textAlignment = NSTextAlignmentCenter;
        _valTextfiled.textColor = [UIColor blackColor];
        _valTextfiled.font = [UIFont systemFontOfSize:15];
        _valTextfiled.keyboardType = UIKeyboardTypeDefault;
        [_valTextfiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _valTextfiled;
}


- (UIButton *)reduceBtn {
    if (!_reduceBtn) {
        _reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reduceBtn addTarget:self action:@selector(clickBtns:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reduceBtn;
}

- (UIButton *)plusBtn {
    if (!_plusBtn) {
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusBtn addTarget:self action:@selector(clickBtns:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusBtn;
}

@end
