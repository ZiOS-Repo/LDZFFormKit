//
//  FormSliderCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormSliderCell.h"
@interface FormSliderCell()
@property(nonatomic, strong) FormSliderCellModel *dataItem;
@property(nonatomic, strong) UIButton *tapAreaBtn;
@property(nonatomic, strong) UITapGestureRecognizer *tapGesture;
@end
@implementation FormSliderCell

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
    [self.bodyView addSubview:self.arrowImg];
    [self.bodyView addSubview:self.keyLable];
    [self.bodyView addSubview:self.valLable];
    [self.bodyView addSubview:self.valSlider];
    [self.bodyView addSubview:self.tapAreaBtn];

    [self.arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowImg.superview).offset(-18);
        make.centerY.equalTo(self.keyLable.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.superview).offset(18);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowImg.mas_left).offset(-8);
        make.centerY.equalTo(self.keyLable.mas_centerY).offset(0);
        make.left.equalTo(self.valLable.superview).offset(150);
    }];
    
    [self.valSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valSlider.superview).offset(-18);
        make.bottom.equalTo(self.valSlider.superview).offset(-15);
        make.left.equalTo(self.valSlider.superview).offset(18);
    }];
    
    [self.tapAreaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.valLable.mas_left).offset(0);
        make.right.equalTo(self.arrowImg.mas_right).offset(0);
        make.centerY.equalTo(self.valLable.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
    }];
}

- (void)loadContent {
    [super loadContent];
    if ([self.data isKindOfClass:[FormSliderCellModel class]]) {
        self.dataItem = self.data;
        ///数据处理
        self.keyLable.font = self.dataItem.keyFont;
        self.keyLable.text = self.dataItem.key;
        self.keyLable.textColor = self.dataItem.keyColor;
        [self.keyLable sizeToFit];
        
        self.valLable.text = [NSString stringWithFormat:@"%.f%%",self.dataItem.value];
        self.arrowImg.image = self.dataItem.expend ? [kFormConfig imageFromCustomBundle:@"arrow_up"] : [kFormConfig imageFromCustomBundle:@"arrow_down"];
        
        ///必须先设置最大最小值，最后设置当前值。
        self.valSlider.minimumValue = self.dataItem.minimumValue;
        self.valSlider.maximumValue = self.dataItem.maximumValue;
        self.valSlider.value = self.dataItem.value;
        self.valSlider.hidden = self.dataItem.expend ? NO:YES;
        self.valSlider.minimumTrackTintColor = self.dataItem.minimumTrackTintColor;
        self.valSlider.maximumTrackTintColor = self.dataItem.maximumTrackTintColor;
        self.valSlider.thumbTintColor = self.dataItem.thumbTintColor;
        
        [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.keyLable.superview).offset(0);
            make.left.equalTo(self.keyLable.superview).offset(self.dataItem.bodyPadding.left);
            make.height.mas_equalTo(self.dataItem.defaultHeight);
            make.width.mas_equalTo(MIN(self.dataItem.keyMaxWidth, self.keyLable.width));
        }];
        
        
        [self.arrowImg mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowImg.superview).offset(-self.dataItem.bodyPadding.right);
            make.centerY.equalTo(self.keyLable.mas_centerY).offset(0);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        
        [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowImg.mas_left).offset(-8);
            make.centerY.equalTo(self.keyLable.mas_centerY).offset(0);
            make.left.equalTo(self.keyLable.mas_right).offset(10);
        }];
        
        [self.valSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.valSlider.superview).offset(-self.dataItem.bodyPadding.right);
            make.bottom.equalTo(self.valSlider.superview).offset(-15);
            make.left.equalTo(self.valSlider.superview).offset(self.dataItem.bodyPadding.left);
        }];
    }
}

- (void)showDebugLine {
    [super showDebugLine];
    self.keyLable.layer.borderColor = [UIColor redColor].CGColor;
    self.keyLable.layer.borderWidth = 1;

    
    self.valLable.layer.borderColor = [UIColor greenColor].CGColor;
    self.valLable.layer.borderWidth = 1;

    self.valSlider.layer.borderColor = [UIColor greenColor].CGColor;
    self.valSlider.layer.borderWidth = 1;

}


-(void)sliderValueDidChanged:(UISlider *)sender{
    if (self.sliderCellDelegate && [self.sliderCellDelegate respondsToSelector:@selector(sliderCell:sliderValueDidChanged:)]) {
        [self.sliderCellDelegate sliderCell:self sliderValueDidChanged:sender];
    }
}

- (void)sliderTouchDown:(UISlider *)sender {
    _tapGesture.enabled = NO;
    [self sliderEnd:sender];
}

- (void)sliderTouchUpInside:(UISlider *)sender {
    _tapGesture.enabled = YES;
    [self sliderEnd:sender];
}

-(void)sliderEnd:(UISlider *)sender{
    if (self.sliderCellDelegate && [self.sliderCellDelegate respondsToSelector:@selector(sliderCell:sliderEnd:)]) {
        [self.sliderCellDelegate sliderCell:self sliderEnd:sender];
    }
}

- (void)clickTapAreaBtn:(UIButton *)sender {
    if (self.sliderCellDelegate && [self.sliderCellDelegate respondsToSelector:@selector(sliderCell:clickAreaBtn:)]) {
        [self.sliderCellDelegate sliderCell:self clickAreaBtn:sender];
    }
}

- (void)actionTapGesture:(UITapGestureRecognizer *)sender {
    CGPoint touchPoint = [sender locationInView:self];
    CGFloat value = (self.valSlider.maximumValue - self.valSlider.minimumValue) * (touchPoint.x / self.valSlider.frame.size.width);
    
    self.valSlider.value = value;
    if (self.sliderCellDelegate && [self.sliderCellDelegate respondsToSelector:@selector(sliderCell:sliderValueDidChanged:)]) {
        [self.sliderCellDelegate sliderCell:self sliderValueDidChanged:self.valSlider];
    }
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

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] init];
        _arrowImg.image = [UIImage imageNamed:@"arrow_down"];
    }
    return _arrowImg;
}

- (UISlider *)valSlider {
    if (!_valSlider) {
        _valSlider = [[UISlider alloc] init];
        //添加触发事件
        [_valSlider addTarget:self action:@selector(sliderValueDidChanged:) forControlEvents:UIControlEventValueChanged];
        [_valSlider addTarget:self action:@selector(sliderTouchDown:) forControlEvents:UIControlEventTouchDown];
        [_valSlider addTarget:self action:@selector(sliderTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapGesture:)];
        _tapGesture.delegate = self;
        [_valSlider addGestureRecognizer:_tapGesture];
    }
    return _valSlider;
}

- (UIButton *)tapAreaBtn {
    if (!_tapAreaBtn) {
        _tapAreaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tapAreaBtn addTarget:self action:@selector(clickTapAreaBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapAreaBtn;
}
@end
