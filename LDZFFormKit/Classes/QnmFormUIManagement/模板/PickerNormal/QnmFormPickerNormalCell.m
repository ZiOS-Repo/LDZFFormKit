//
//  QnmFormPickerNormalCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/21.
//

#import "QnmFormPickerNormalCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
#define degrees_TO_radians(x) (x * M_PI/180.0)
@interface QnmFormPickerNormalCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) UILabel *placeholdLable;
@property(nonatomic, strong) UIImageView *extrIcon;
@end

@implementation QnmFormPickerNormalCell

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
    [self.contentView addSubview:self.placeholdLable];
    [self.contentView addSubview:self.valLable];
    [self.contentView addSubview:self.extrIcon];
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.superview).offset(15);
        make.centerY.equalTo(self.keyLable.superview).offset(0);
    }];
    [self.placeholdLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.placeholdLable.superview).offset(-15);
        make.centerY.equalTo(self.placeholdLable.superview).offset(0);
        make.left.equalTo(self.placeholdLable.superview).offset(150);
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.valLable.superview).offset(-15);
        make.centerY.equalTo(self.valLable.superview).offset(0);
        make.left.equalTo(self.valLable.superview).offset(150);
    }];
    [self.extrIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrIcon.superview).offset(-15);
        make.centerY.equalTo(self.extrIcon.superview).offset(0);
    }];
}


#pragma mark - configure
- (void)configureWithModel:(QnmFormItemModel *)model {
    [super configureWithModel:model];
    [self keyInfoWithModel:model];
    [self valueInfoWithModel:model];
    [self placeholderInfoWithModel:model];
    [self extrIconInfoWithModel:model];
    if (isStringEmptyOrNil(model.valueScheme.value)) {
        self.valLable.hidden = YES;
        self.placeholdLable.hidden = NO;
    } else {
        self.valLable.hidden = NO;
        self.placeholdLable.hidden = YES;
    }
}

- (void)keyInfoWithModel:(QnmFormItemModel *)model {
    [self layoutIfNeeded];
    self.keyLable.font      = model.uiScheme.qnm_titleIN.qnm_font;
    self.keyLable.textColor = model.uiScheme.qnm_titleIN.qnm_color;
    self.keyLable.text      = model.valueScheme.title;
    [self.keyLable sizeToFit];
    CGFloat widthRatio = model.uiScheme.qnm_titleIN.qnm_widthRatio;
    CGFloat titleMaxWidth = (self.width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(model.uiScheme.qnm_paddingLeft);
        make.centerY.equalTo(self.contentView).offset(0);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.width));
    }];

}

- (void)placeholderInfoWithModel:(QnmFormItemModel *)model {
    CGSize extrIconSize = CGSizeFromString(safeString(model.uiScheme.qnm_iconIN.size));
    self.placeholdLable.font      = model.uiScheme.qnm_placeholderIN.qnm_font;
    self.placeholdLable.textColor = model.uiScheme.qnm_placeholderIN.qnm_color;
    self.placeholdLable.text      = model.valueScheme.placeholder;
    [self.placeholdLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (CGSizeIsEmpty(extrIconSize)) {
            make.right.equalTo(self.contentView).offset(-model.uiScheme.qnm_paddingRight);
        } else {
            make.right.equalTo(self.extrIcon.mas_left).offset(0);
        }
        make.centerY.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    CGSize extrIconSize = CGSizeFromString(safeString(model.uiScheme.qnm_iconIN.size));
    self.valLable.font      = model.uiScheme.qnm_subtitleIN.qnm_font;
    self.valLable.textColor = model.uiScheme.qnm_subtitleIN.qnm_color;
    self.valLable.text      = model.valueScheme.value;
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (CGSizeIsEmpty(extrIconSize)) {
            make.right.equalTo(self.contentView).offset(-model.uiScheme.qnm_paddingRight);
        } else {
            make.right.equalTo(self.extrIcon.mas_left).offset(0);
        }
        make.centerY.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
    }];
}

- (void)extrIconInfoWithModel:(QnmFormItemModel *)model {
    CGSize extrIconSize = CGSizeFromString(safeString(model.uiScheme.qnm_iconIN.size));
    self.extrIcon.image = [self imageNamed:model.uiScheme.qnm_iconIN.url];
    self.extrIcon.transform = CGAffineTransformIdentity;
    self.extrIcon.angle = degrees_TO_radians(90);
    [self.extrIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-model.uiScheme.qnm_paddingRight);
        make.centerY.equalTo(self.contentView).offset(0);
        make.size.mas_equalTo(extrIconSize);
    }];
}

#pragma mark - 懒加载
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

- (UILabel *)placeholdLable {
    if (_placeholdLable == nil) {
        _placeholdLable = [[UILabel alloc] init];
        _placeholdLable.textAlignment = NSTextAlignmentRight;
    }
    return _placeholdLable;
}

- (UIImageView *)extrIcon {
    if (!_extrIcon) {
        _extrIcon = [[UIImageView alloc] init];
    }
    return _extrIcon;
}


@end
