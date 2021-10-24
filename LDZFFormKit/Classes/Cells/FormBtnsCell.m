//
//  FormBtnsCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormBtnsCell.h"

@interface FormBtnsCell()
@property(nonatomic, strong) UIView *btnsView;
@property(nonatomic, strong) FormBtnsCellModel *dataItem;
@end

@implementation FormBtnsCell

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
    [self.bodyView addSubview:self.btnsView];
    [self.btnsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.btnsView.superview).offset(0);
        make.right.equalTo(self.btnsView.superview).offset(-18);
        make.left.equalTo(self.keyLable.mas_right).offset(30);
    }];
}

- (void)loadContent {
    [super loadContent];
    if ([self.data isKindOfClass:[FormBtnsCellModel class]]) {
        self.dataItem = self.data;
        
        [self.btnsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self addBtnsToViewWithDatas:self.dataItem.choices];
        [self refreshSelect:self.dataItem.val];
        
        [self.btnsView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.btnsView.superview).offset(0);
            make.right.equalTo(self.btnsView.superview).offset(-self.dataItem.bodyPadding.right);
            make.left.equalTo(self.keyLable.mas_right).offset(30);
        }];
    }
}

- (void)showDebugLine {
    [super showDebugLine];
    
    self.btnsView.layer.borderColor = [UIColor greenColor].CGColor;
    self.btnsView.layer.borderWidth = 1;
}


- (void)clickItem:(UIButton *)sender {
    self.dataItem.val = sender.titleLabel.text;
    [self refreshSelect:self.dataItem.val];
    if (self.btnsCellDelegate && [self.btnsCellDelegate respondsToSelector:@selector(btnsCellOfValueChanged:)]) {
        [self.btnsCellDelegate btnsCellOfValueChanged:self];
    }
}

- (void)refreshSelect:(NSString *)selectText {
    for (UIView *view in self.btnsView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            btn.selected = NO;
            btn.layer.borderColor = self.dataItem.btn_normal_color.CGColor;

            if ([btn.titleLabel.text isEqualToString:selectText]) {
                btn.selected = YES;
                btn.layer.borderColor = self.dataItem.btn_select_color.CGColor;
            }
        }
    }
}

- (void)addBtnsToViewWithDatas:(NSArray *)datas {
    UIButton *lastBtn;
    for (NSInteger i = datas.count - 1; i >= 0; i--) {
        NSString *title = datas[i];
        
        UIButton *btn = [[UIButton alloc] init];
        btn.layer.cornerRadius = self.dataItem.btn_cornerRadius;
        btn.layer.borderWidth = self.dataItem.btn_borderWidth;
        btn.titleLabel.font = self.dataItem.valFont;
        [btn setTitleColor:self.dataItem.btn_normal_color forState:UIControlStateNormal];
        [btn setTitleColor:self.dataItem.btn_select_color forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:title forState:UIControlStateNormal];
        [self.btnsView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.dataItem.btn_size);
            make.centerY.equalTo(self.btnsView);
            if (lastBtn) {
                make.right.equalTo(lastBtn.mas_left).offset(-14);
            } else {
                make.right.equalTo(self.btnsView).offset(0);
            }
        }];
        
        lastBtn = btn;
    }
}

#pragma mark - 懒加载
- (UIView *)btnsView {
    if (!_btnsView) {
        _btnsView = [[UIView alloc] init];
    }
    return _btnsView;
}
@end
