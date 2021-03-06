//
//  QnmFormSliderCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmFormSliderCell.h"

#import <YYText/YYText.h>
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"

@interface QnmFormSliderCell()<YYTextViewDelegate>
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) UIImageView *extrIcon;
@property(nonatomic, strong) UISlider *valSlider;
@property(nonatomic, strong) UITapGestureRecognizer *tapGesture;
@end

@implementation QnmFormSliderCell
#pragma mark - init & dealloc
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        [self setupDefaultSubViews];
        [self setupConstraints];
        
        [self.valLable qnm_addTapGestureRecognizerWithTarget:self action:@selector(switchifExpand)];
    }
    
    return self;
}

- (void)setupDefaultSubViews {
    [self.contentView addSubview:self.keyLable];
    [self.contentView addSubview:self.valLable];
    [self.contentView addSubview:self.extrIcon];
    [self.contentView addSubview:self.valSlider];
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(15);
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(150);
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    [self.extrIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    [self.valSlider mas_makeConstraints:^(MASConstraintMaker *make) {
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
    [self extrIconInfoWithModel:model];
    [self valSliderInfoWithModel:model];
}

- (void)keyInfoWithModel:(QnmFormItemModel *)model {
    [self layoutIfNeeded];
    self.keyLable.font      = model.uiScheme.titleIN.qnm_font;
    self.keyLable.textColor = model.uiScheme.titleIN.qnm_color;
    self.keyLable.text      = model.valueScheme.title;
    [self.keyLable sizeToFit];
    CGFloat widthRatio = model.uiScheme.titleIN.qnm_widthRatio;
    CGFloat titleMaxWidth = (self.qmui_width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.qmui_width));
        make.height.mas_equalTo(model.height);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valLable.font      = model.uiScheme.subtitleIN.qnm_font;
    self.valLable.textColor = model.uiScheme.subtitleIN.qnm_color;
    self.valLable.text      = safeString(model.valueScheme.value);
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
        make.right.equalTo(self.extrIcon.mas_left).offset(0);
        make.height.mas_equalTo(model.height);
    }];
}

- (void)extrIconInfoWithModel:(QnmFormItemModel *)model {
    CGSize extrIconSize = CGSizeMake(22, 22);
    self.extrIcon.image = model.ifExpand ? [self imageNamed:@"arrow_up"] : [self imageNamed:@"arrow_down"];
    [self.extrIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(extrIconSize);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
        make.centerY.equalTo(self.keyLable.mas_centerY).offset(0);
    }];
}


- (void)valSliderInfoWithModel:(QnmFormItemModel *)model {
    self.valSlider.minimumTrackTintColor    = model.uiScheme.sliderIN.qnm_minimumTrackTintColor;
    self.valSlider.maximumTrackTintColor    = model.uiScheme.sliderIN.qnm_maximumTrackTintColor;
    self.valSlider.thumbTintColor           = model.uiScheme.sliderIN.qnm_thumbTintColor;

    ///?????????????????????????????????????????????????????????
    self.valSlider.minimumValue = [model.valueScheme.minimum floatValue];
    self.valSlider.maximumValue = [model.valueScheme.maximum floatValue];
    self.valSlider.value        = [model.valueScheme.value floatValue];
    [self.valSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(model.height);
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
        make.height.mas_equalTo(model.mutableHeight);
    }];
}

#pragma mark---UITextViewDelegate
- (void)switchifExpand {
    self.holdModel.ifExpand = !self.holdModel.ifExpand;
    if (self.reloadOperation) {
        self.reloadOperation(1, self);
    }
}

- (void)sliderValueDidChanged:(UISlider *)sender{
    ///??????
    int discreteValue = roundl([sender value]); // Rounds float to an integer
    discreteValue = discreteValue / 10 * 10;
    [sender setValue:(float)discreteValue]; // Sets your slider to this value

    self.holdModel.valueScheme.value = [NSString stringWithFormat:@"%.f",sender.value];
    if (self.reloadOperation) {
        self.reloadOperation(1, self);
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
    
}

- (void)actionTapGesture:(UITapGestureRecognizer *)sender {
    CGPoint touchPoint = [sender locationInView:self];
    CGFloat value = (self.valSlider.maximumValue - self.valSlider.minimumValue) * (touchPoint.x / self.valSlider.frame.size.width);
    self.holdModel.valueScheme.value = [NSString stringWithFormat:@"%.f",value];
    if (self.reloadOperation) {
        self.reloadOperation(1, self);
    }
}


#pragma mark - ?????????
- (UILabel *)keyLable {
    if (_keyLable == nil) {
        _keyLable = [[UILabel alloc] init];
        _keyLable.textAlignment = NSTextAlignmentLeft;
    }
    return _keyLable;
}
- (UILabel *)valLable {
    if (_valLable == nil) {
        _valLable = [[UILabel alloc] init];
        _valLable.textAlignment = NSTextAlignmentRight;
    }
    return _valLable;
}
- (UIImageView *)extrIcon {
    if (!_extrIcon) {
        _extrIcon = [[UIImageView alloc] init];
    }
    return _extrIcon;
}
- (UISlider *)valSlider {
    if (!_valSlider) {
        _valSlider = [[UISlider alloc] init];
        //??????????????????
        [_valSlider addTarget:self action:@selector(sliderValueDidChanged:) forControlEvents:UIControlEventValueChanged];
        [_valSlider addTarget:self action:@selector(sliderTouchDown:) forControlEvents:UIControlEventTouchDown];
        [_valSlider addTarget:self action:@selector(sliderTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        //??????????????????
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapGesture:)];
        _tapGesture.delegate = self;
        [_valSlider addGestureRecognizer:_tapGesture];
    }
    return _valSlider;
}




@end

