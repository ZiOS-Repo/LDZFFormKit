//
//  FormKVCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormKVCell.h"
@interface FormKVCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) FormKVBean *dataItem;
@end

@implementation FormKVCell

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
        make.left.equalTo(self.keyLable.superview).offset(18);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valLable.superview).offset(-18);
        make.centerY.equalTo(self.valLable.superview).offset(0);
        make.left.equalTo(self.valLable.superview).offset(150);
    }];
    
    // 设置抗压缩优先级
    [self.keyLable setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self.valLable setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)loadContent {
    [super loadContent];
    if (![self.data isKindOfClass:[FormKVBean class]]) return;
    
    self.dataItem = self.data;
    
    self.keyLable.font = self.dataItem.keyFont;
    self.keyLable.text = self.dataItem.key;
    self.keyLable.textColor = self.dataItem.keyColor;

    self.valLable.font = self.dataItem.valFont;
    self.valLable.text = self.dataItem.val;
    self.valLable.textColor = self.dataItem.valColor;
    
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.superview).offset(self.dataItem.bodyPadding.left);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valLable.superview).offset(-self.dataItem.bodyPadding.right);
        make.centerY.equalTo(self.valLable.superview).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
        make.width.mas_greaterThanOrEqualTo(100);
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
- (UILabel *)keyLable {
    if (!_keyLable) {
        _keyLable = [[UILabel alloc] init];
        _keyLable.lineBreakMode = NSLineBreakByTruncatingTail;
        _keyLable.textAlignment = NSTextAlignmentLeft;
        _keyLable.textColor = [UIColor blackColor];
        _keyLable.numberOfLines = 1;
        _keyLable.font = [UIFont systemFontOfSize:15];
    }
    return _keyLable;
}

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

@end
