//
//  QnmFormDateCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/24.
//

#import "QnmFormDateCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import <LDZFAlertDialog/LDZFAlertDialog.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
#import "QnmFormUtils.h"

#define degrees_TO_radians(x) (x * M_PI/180.0)
@interface QnmFormDateCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) UILabel *placeholdLable;
@property(nonatomic, strong) UIImageView *extrIcon;
@end

@implementation QnmFormDateCell

#pragma mark - init & dealloc
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupDefaultSubViews];
        [self setupConstraints];
        [self qnm_addTapGestureRecognizerWithTarget:self action:@selector(clickSelff)];
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
    self.keyLable.font      = model.uiScheme.titleIN.qnm_font;
    self.keyLable.textColor = model.uiScheme.titleIN.qnm_color;
    self.keyLable.text      = model.valueScheme.title;
    [self.keyLable sizeToFit];
    CGFloat widthRatio = model.uiScheme.titleIN.qnm_widthRatio;
    CGFloat titleMaxWidth = (self.width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(model.uiScheme.qnm_paddingLeft);
        make.centerY.equalTo(self.contentView).offset(0);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.width));
    }];

}

- (void)placeholderInfoWithModel:(QnmFormItemModel *)model {
    self.placeholdLable.font      = model.uiScheme.placeholderIN.qnm_font;
    self.placeholdLable.textColor = model.uiScheme.placeholderIN.qnm_color;
    self.placeholdLable.text      = model.valueScheme.placeholder;
    [self.placeholdLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrIcon.mas_left).offset(0);
        make.centerY.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valLable.font      = model.uiScheme.subtitleIN.qnm_font;
    self.valLable.textColor = model.uiScheme.subtitleIN.qnm_color;
    self.valLable.text      = safeString(model.valueScheme.value);
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.extrIcon.mas_left).offset(0);
        make.centerY.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.keyLable.mas_right).offset(10);
    }];
}

- (void)extrIconInfoWithModel:(QnmFormItemModel *)model {
    self.extrIcon.image = [self imageNamed:@"arrow_up"];
    self.extrIcon.transform = CGAffineTransformIdentity;
    self.extrIcon.angle = degrees_TO_radians(90);
    [self.extrIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-model.uiScheme.qnm_paddingRight);
        make.centerY.equalTo(self.contentView).offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
}

#pragma mark - event
- (void)clickSelff {
    kWeakSelf
    AlertDateDialog *dialog = AlertDateDialog.build;
    dialog.withInfo(@"请选择-开始时间");
    [dialog setDialogWillShow:^(AlertBaseDialog *dialog) {
        kStrongSelf
        NSDate *date = [QnmFormUtils stringChangeToDate:strongSelf.holdModel.valueScheme.value dateFormat:strongSelf.holdModel.valueScheme.dateFormat];
        NSString *dateFormat = strongSelf.holdModel.valueScheme.dateFormat;
        UIDatePicker *datePicker  = dialog.picker;
        
        if ([[dateFormat lowercaseString] containsString:@"hh"]) {
            datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        } else {
            datePicker.datePickerMode = UIDatePickerModeDate;
        }
        datePicker.date = date;
    }];
    [dialog setDidSelectedItems:^(AlertDateDialog *dialog, NSArray *items) {
        kStrongSelf
        if (items.count == 0) return;
        if (![items.firstObject isKindOfClass:NSDate.class]) return;
        strongSelf.holdModel.valueScheme.value = [QnmFormUtils dateChangeToString:items.firstObject dateFormat:strongSelf.holdModel.valueScheme.dateFormat];
        if (strongSelf.reloadOperation) {
            strongSelf.reloadOperation(1, strongSelf);
        }
    }];
    [self.qnm_viewController presentViewController:dialog animated:NO completion:nil];
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

