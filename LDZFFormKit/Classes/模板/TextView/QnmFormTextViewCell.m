//
//  QnmFormTextViewCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmFormTextViewCell.h"
#import <YYText/YYText.h>
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"

@interface QnmFormTextViewCell()<YYTextViewDelegate>
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) YYTextView *valTextView;

@end

@implementation QnmFormTextViewCell
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
    [self.contentView addSubview:self.valTextView];
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(15);
    }];
    [self.valTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(16);
        make.left.mas_offset(18);
        make.right.mas_offset(-18);
        make.bottom.mas_offset(-16);
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
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(5);
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valTextView.font               = model.uiScheme.textViewIN.qnm_font;
    self.valTextView.textColor          = model.uiScheme.textViewIN.qnm_color;
    self.valTextView.keyboardType       = model.uiScheme.textViewIN.qnm_keyboardType;
    self.valTextView.returnKeyType      = model.uiScheme.textViewIN.qnm_returnKeyType;
    self.valTextView.placeholderFont    = model.uiScheme.textViewIN.qnm_placeholderFont;
    self.valTextView.editable           = model.uiScheme.qnm_editable;
    self.valTextView.text               = model.valueScheme.value;
    self.valTextView.placeholderText    = model.valueScheme.placeholder;
    [self.valTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.keyLable.mas_bottom).offset(5);
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
        make.bottom.mas_offset(-5);
    }];
}



#pragma mark---UITextViewDelegate
- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
}

- (void)textViewDidChange:(YYTextView *)textView {

}

- (void)textViewDidEndEditing:(YYTextView *)textView {

}

- (void)textViewDidBeginEditing:(YYTextView *)textView {
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableDebugging = YES;
    [[IQKeyboardManager sharedManager] registerTextFieldViewClass:[YYTextView class] didBeginEditingNotificationName:YYTextViewTextDidBeginEditingNotification didEndEditingNotificationName:YYTextViewTextDidEndEditingNotification];
}

#pragma mark - 懒加载
- (UILabel *)keyLable {
    if (_keyLable == nil) {
        _keyLable = [[UILabel alloc] init];
        _keyLable.textAlignment = NSTextAlignmentLeft;
    }
    return _keyLable;
}

- (YYTextView *)valTextView {
    if (!_valTextView) {
        _valTextView = [[YYTextView alloc] init];
        _valTextView.placeholderText = @"请输入";
        _valTextView.placeholderFont = [UIFont systemFontOfSize:14];
        _valTextView.textColor = [UIColor blackColor];
        _valTextView.font = [UIFont systemFontOfSize:14];
        _valTextView.delegate = self;
        _valTextView.backgroundColor = kHexColor(0xEEEEEE);
        
    }
    return _valTextView;
}



@end

