//
//  FormAttrCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormAttrCell.h"

@interface FormAttrCell ()
@property(nonatomic, strong) FormAttrCellModel *dataItem;
@end

@implementation FormAttrCell

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
    [self.bodyView addSubview:self.valLable];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valLable.superview).offset(-18);
        make.centerY.equalTo(self.valLable.superview).offset(0);
        make.left.equalTo(self.valLable.superview).offset(18);
    }];
}

- (void)loadContent {
    [super loadContent];
    if ([self.data isKindOfClass:[FormAttrCellModel class]]) {
        self.dataItem = self.data;
        self.valLable.attributedText = self.dataItem.val;

        [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.valLable.superview).offset(-self.dataItem.bodyPadding.right);
            make.left.equalTo(self.valLable.superview).offset(self.dataItem.bodyPadding.left);
            make.top.equalTo(self.valLable.superview).offset(self.dataItem.safeTop);
            make.bottom.equalTo(self.valLable.superview).offset(-self.dataItem.safeBottom);
        }];
        
    }
}

- (void)showDebugLine {
    [super showDebugLine];
    self.valLable.layer.borderColor = [UIColor greenColor].CGColor;
    self.valLable.layer.borderWidth = 1;
}

#pragma mark - 懒加载
- (UILabel *)valLable {
    if (!_valLable) {
        _valLable = [[UILabel alloc] init];
        _valLable.lineBreakMode = NSLineBreakByTruncatingTail;
        _valLable.textAlignment = NSTextAlignmentLeft;
        _valLable.textColor = [UIColor blackColor];
        _valLable.numberOfLines = 0;
        _valLable.font = [UIFont systemFontOfSize:14];
    }
    return _valLable;
}

@end
