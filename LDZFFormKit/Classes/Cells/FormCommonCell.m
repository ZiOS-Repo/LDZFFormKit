//
//  FormCommonCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonCell.h"
@interface FormCommonCell()
@property(nonatomic, strong) FormCommonCellModel *dataItem;
@end
@implementation FormCommonCell

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
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.superview).offset(18);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
}

- (void)loadContent {
    [super loadContent];
    if ([self.data isKindOfClass:[FormCommonCellModel class]]) {
        self.dataItem = self.data;
        //数据赋值
        self.keyLable.font = self.dataItem.keyFont;
        self.keyLable.text = self.dataItem.key;
        self.keyLable.textColor = self.dataItem.keyColor;
        [self.keyLable sizeToFit];
                        
        [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.keyLable.superview).offset(self.dataItem.bodyPadding.left);
            make.centerY.equalTo(self.keyLable.superview).offset(0);
            make.width.mas_equalTo(MIN(self.dataItem.keyMaxWidth, self.keyLable.width));
        }];
    }
}

- (void)showDebugLine {
    self.keyLable.layer.borderColor = [UIColor redColor].CGColor;
    self.keyLable.layer.borderWidth = 1;
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


@end
