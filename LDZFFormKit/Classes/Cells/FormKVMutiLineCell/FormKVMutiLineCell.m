//
//  FormKVMutiLineCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormKVMutiLineCell.h"
@interface FormKVMutiLineCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) FormKVMutiLineBean *dataItem;
@end
@implementation FormKVMutiLineCell

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
    [self.bodyView addSubview:self.keyLable];
    [self.bodyView addSubview:self.valLable];
    
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.keyLable.superview).offset(0);
        make.left.equalTo(self.keyLable.superview).offset(18);
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.valLable.superview).offset(0);
        make.right.equalTo(self.valLable.superview).offset(-18);
        make.left.equalTo(self.valLable.superview).offset(150);
    }];
}

- (void)loadContent {
    [super loadContent];
    if (![self.data isKindOfClass:[FormKVMutiLineBean class]]) return;
    
    self.dataItem = self.data;
    self.keyLable.attributedText = self.dataItem.key;
    self.valLable.attributedText = self.dataItem.val;

    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.keyLable.superview).offset(self.dataItem.safeTop);
        make.left.equalTo(self.keyLable.superview).offset(self.dataItem.bodyPadding.left);
        make.width.mas_equalTo(self.dataItem.keyMaxWidth);
    }];
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.valLable.superview).offset(self.dataItem.safeTop);
        make.right.equalTo(self.valLable.superview).offset(-self.dataItem.bodyPadding.right);
        make.left.equalTo(self.keyLable.mas_right).offset(self.dataItem.hGap);
    }];

}

- (void)showDebugLine {
    [super showDebugLine];
    self.keyLable.layer.borderColor = [UIColor redColor].CGColor;
    self.keyLable.layer.borderWidth = 1;

    self.valLable.layer.borderColor = [UIColor greenColor].CGColor;
    self.valLable.layer.borderWidth = 1;
}


#pragma mark - 懒加载
- (UILabel *)valLable {
    if (!_valLable) {
        _valLable = [[UILabel alloc] init];
        _valLable.lineBreakMode = NSLineBreakByTruncatingTail;
        _valLable.textAlignment = NSTextAlignmentRight;
        _valLable.textColor = [UIColor blackColor];
        _valLable.numberOfLines = 0;
        _valLable.font = [UIFont systemFontOfSize:15];
    }
    return _valLable;
}

- (UILabel *)keyLable {
    if (!_keyLable) {
        _keyLable = [[UILabel alloc] init];
        _keyLable.lineBreakMode = NSLineBreakByTruncatingTail;
        _keyLable.textAlignment = NSTextAlignmentLeft;
        _keyLable.textColor = [UIColor blackColor];
        _keyLable.numberOfLines = 0;
        _keyLable.font = [UIFont systemFontOfSize:15];
    }
    return _keyLable;
}
@end
