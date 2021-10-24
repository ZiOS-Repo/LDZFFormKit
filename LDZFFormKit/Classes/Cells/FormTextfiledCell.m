//
//  FormTextfiledCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormTextfiledCell.h"
#import "IQKeyboardManager/IQKeyboardManager.h"
@interface FormTextfiledCell () <UITextFieldDelegate>
@property(nonatomic, strong) UIView *rightView;
@property(nonatomic, strong) UIView *rightViewContainer;

@property(nonatomic, strong) FormTextfiledCellModel *dataItem;
@end

@implementation FormTextfiledCell

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
    [self.bodyView addSubview:self.rightViewContainer];
    [self.bodyView addSubview:self.valTextfiled];
    
    [self.valTextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightViewContainer.mas_left).offset(0);
        make.top.bottom.equalTo(self.valTextfiled.superview).offset(0);
        make.left.equalTo(self.valTextfiled.superview).offset(150);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    ///右侧视图
    [self.rightViewContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (self.inputCellDelegate && [self.inputCellDelegate respondsToSelector:@selector(rightViewForTextField:cell:)]) {
        self.rightView = [self.inputCellDelegate rightViewForTextField:self.valTextfiled cell:self];
        if (self.rightView) {
            [self.rightViewContainer addSubview:self.rightView];
        }
    } else {
        self.rightView = nil;
    }

    if (self.rightView) {
        self.rightView.left = 0;
        self.rightView.top = 0;
        self.rightView.height = self.contentView.height;
    }
    self.rightViewContainer.top = 0;
    self.rightViewContainer.height = self.contentView.height;
    self.rightViewContainer.width = self.rightView ? CGRectGetWidth(self.rightView.frame) : 0;
    self.rightViewContainer.left = self.contentView.width - self.rightViewContainer.width - self.dataItem.bodyPadding.right;
}


- (void)loadContent {
    [super loadContent];
    if ([self.data isKindOfClass:[FormTextfiledCellModel class]]) {
        self.dataItem = self.data;
        self.valTextfiled.text = self.dataItem.val;
        self.valTextfiled.textColor = self.dataItem.valColor;
        self.valTextfiled.placeholder = self.dataItem.placeholder;
        self.valTextfiled.enabled = self.dataItem.enableEdit;
        self.valTextfiled.keyboardType = self.dataItem.keyboardType;
        self.valTextfiled.returnKeyType = self.dataItem.returnKeyType;
        
        [self.valTextfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.rightViewContainer.mas_left).offset(0);
            make.top.bottom.equalTo(self.valTextfiled.superview).offset(0);
            make.left.equalTo(self.keyLable.mas_right).offset(10);
        }];
    }
}

- (void)showDebugLine {
    [super showDebugLine];
    self.valTextfiled.layer.borderColor = [UIColor greenColor].CGColor;
    self.valTextfiled.layer.borderWidth = 1;

    self.rightViewContainer.layer.borderColor = [UIColor redColor].CGColor;
    self.rightViewContainer.layer.borderWidth = 1;
}

#pragma mark--- textFieldDidChange
- (void)textFieldDidChange:(UITextField *)textField {
    if (self.inputCellDelegate && [self.inputCellDelegate respondsToSelector:@selector(textfiledCell:textFieldDidChange:)]) {
        [self.inputCellDelegate textfiledCell:self textFieldDidChange:textField];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.inputCellDelegate && [self.inputCellDelegate respondsToSelector:@selector(textfiledCell:textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.inputCellDelegate textfiledCell:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.inputCellDelegate && [self.inputCellDelegate respondsToSelector:@selector(textfiledCell:textFieldDidEndEditing:)]) {
        [self.inputCellDelegate textfiledCell:self textFieldDidEndEditing:textField];
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
        _valTextfiled.textAlignment = NSTextAlignmentRight;
        _valTextfiled.textColor = [UIColor blackColor];
        _valTextfiled.font = [UIFont systemFontOfSize:14];
        _valTextfiled.keyboardType = UIKeyboardTypeDefault;
        [_valTextfiled addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _valTextfiled;
}

-(UIView *)rightViewContainer {
    if (!_rightViewContainer) {
        _rightViewContainer = [[UIView alloc] init];
    }
    return _rightViewContainer;
}
@end
