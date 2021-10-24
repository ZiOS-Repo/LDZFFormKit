//
//  FormTextViewCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormTextViewCell.h"
#import "IQKeyboardManager/IQKeyboardManager.h"

@interface FormTextViewCell()<YYTextViewDelegate>
@property(nonatomic, strong) FormTextViewCellModel *dataItem;
@end

@implementation FormTextViewCell

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
    [self.bodyView addSubview:self.valTextView];
    [self.valTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.valTextView.superview).offset(16);
        make.left.equalTo(self.valTextView.superview).offset(18);
        make.right.equalTo(self.valTextView.superview).offset(-18);
        make.bottom.equalTo(self.valTextView.superview).offset(-16);
    }];
}

- (void)loadContent {
    [super loadContent];
    if ([self.data isKindOfClass:[FormTextViewCellModel class]]) {
        self.dataItem = self.data;
        self.valTextView.text = self.dataItem.val;
        self.valTextView.placeholderText = self.dataItem.placeholder;
        self.valTextView.editable = self.dataItem.enableEdit;
        
        [self.valTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.valTextView.superview).offset(16);
            make.left.equalTo(self.valTextView.superview).offset(self.dataItem.bodyPadding.left);
            make.right.equalTo(self.valTextView.superview).offset(-self.dataItem.bodyPadding.right);
            make.bottom.equalTo(self.valTextView.superview).offset(-16);
        }];
    }
}

- (void)showDebugLine {
    [super showDebugLine];
    self.valTextView.layer.borderColor = [UIColor redColor].CGColor;
    self.valTextView.layer.borderWidth = 1;
}

#pragma mark---UITextViewDelegate
- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (self.textViewCellDelegate && [self.textViewCellDelegate respondsToSelector:@selector(textViewCell:textView:shouldChangeTextInRange:replacementText:)]) {
        return [self.textViewCellDelegate textViewCell:self textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

- (void)textViewDidChange:(YYTextView *)textView {
    if (self.textViewCellDelegate && [self.textViewCellDelegate respondsToSelector:@selector(textViewCell:textViewDidChange:)]) {
        [self.textViewCellDelegate textViewCell:self textViewDidChange:textView];
    }
}

- (void)textViewDidEndEditing:(YYTextView *)textView {
    if (self.textViewCellDelegate && [self.textViewCellDelegate respondsToSelector:@selector(textViewCell:textViewDidEndEditing:)]) {
        [self.textViewCellDelegate textViewCell:self textViewDidEndEditing:textView];
    }
}

- (void)textViewDidBeginEditing:(YYTextView *)textView {
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableDebugging = YES;
    [[IQKeyboardManager sharedManager] registerTextFieldViewClass:[YYTextView class] didBeginEditingNotificationName:YYTextViewTextDidBeginEditingNotification didEndEditingNotificationName:YYTextViewTextDidEndEditingNotification];
}
#pragma mark - 懒加载
- (YYTextView *)valTextView {
    if (!_valTextView) {
        _valTextView = [[YYTextView alloc] init];
        _valTextView.placeholderText = @"请输入";
        _valTextView.placeholderFont = [UIFont systemFontOfSize:14];
        _valTextView.textColor = [UIColor blackColor];
        _valTextView.font = [UIFont systemFontOfSize:14];
        _valTextView.delegate = self;
    }
    return _valTextView;
}

@end

