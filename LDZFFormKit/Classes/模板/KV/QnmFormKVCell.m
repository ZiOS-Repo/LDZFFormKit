//
//  QnmFormKVCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormKVCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
@interface QnmFormKVCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@end

@implementation QnmFormKVCell

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
    [self.contentView addSubview:self.valLable];
}

- (void)setupConstraints {
    [self.keyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    [self.valLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(150);
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
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
    [self.keyLable sizeToFit];
    CGFloat widthRatio = model.uiScheme.titleIN.qnm_widthRatio;
    CGFloat titleMaxWidth = (self.qmui_width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.qmui_width));
        make.centerY.mas_offset(0);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valLable.font      = model.uiScheme.subtitleIN.qnm_font;
    self.valLable.textColor = model.uiScheme.subtitleIN.qnm_color;
    self.valLable.text      = model.valueScheme.value;
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.mas_right).offset(10);
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
        make.centerY.mas_offset(0);
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


@end
