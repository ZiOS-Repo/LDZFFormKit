//
//  QnmFormSingleChoiceCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/24.
//

#import "QnmFormSingleChoiceCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import <LDZFAlertDialog/LDZFAlertDialog.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
#import "QnmFormUtils.h"

#define degrees_TO_radians(x) (x * M_PI/180.0)
@interface QnmFormSingleChoiceCell()
@property(nonatomic, strong) UILabel *keyLable;
@property(nonatomic, strong) UILabel *valLable;
@property(nonatomic, strong) UILabel *placeholdLable;
@property(nonatomic, strong) UIImageView *extrIcon;
@end

@implementation QnmFormSingleChoiceCell

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
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    [self.placeholdLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(150);
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
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
    CGFloat titleMaxWidth = (self.qmui_width - model.uiScheme.qnm_paddingLeft - model.uiScheme.qnm_paddingRight) * widthRatio;
    [self.keyLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(model.uiScheme.qnm_paddingLeft);
        make.width.mas_equalTo(MIN(titleMaxWidth, self.keyLable.qmui_width));
        make.centerY.mas_offset(0);
    }];

}

- (void)placeholderInfoWithModel:(QnmFormItemModel *)model {
    self.placeholdLable.font      = model.uiScheme.placeholderIN.qnm_font;
    self.placeholdLable.textColor = model.uiScheme.placeholderIN.qnm_color;
    self.placeholdLable.text      = model.valueScheme.placeholder;
    [self.placeholdLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.mas_right).offset(10);
        make.right.equalTo(self.extrIcon.mas_left).offset(0);
        make.centerY.mas_offset(0);
    }];
}

- (void)valueInfoWithModel:(QnmFormItemModel *)model {
    self.valLable.font      = model.uiScheme.subtitleIN.qnm_font;
    self.valLable.textColor = model.uiScheme.subtitleIN.qnm_color;
    self.valLable.text      = safeString(model.valueScheme.value);
    [self.valLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.keyLable.mas_right).offset(10);
        make.right.equalTo(self.extrIcon.mas_left).offset(0);
        make.centerY.mas_offset(0);
    }];
}

- (void)extrIconInfoWithModel:(QnmFormItemModel *)model {
    self.extrIcon.image = [self imageNamed:@"arrow_up"];
    self.extrIcon.transform = CGAffineTransformIdentity;
    self.extrIcon.angle = degrees_TO_radians(90);
    [self.extrIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-model.uiScheme.qnm_paddingRight);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.centerY.mas_offset(0);
    }];
}

#pragma mark - event
- (void)clickSelff {
    if (!self.holdModel.uiScheme.qnm_editable) {
        return;
    }
    kWeakSelf
    //加载NSString
    NSMutableArray *datas = [NSMutableArray array];
    for (id obj in self.holdModel.valueScheme.enums) {
        if ([obj isKindOfClass:NSString.class]) {
            [datas qnm_addObj:[NSString stringWithFormat:@"%@",obj]];
        }
        else if ([obj isKindOfClass:NSDictionary.class]) {
            [datas qnm_addObj:[NSString stringWithFormat:@"%@",obj[@"title"]]];
        }
    }
    AlertSingleChoiceDialog *dialog = AlertSingleChoiceDialog.build;
    dialog.withInfo(@"请选择").withSelectedItem(self.holdModel.valueScheme.value).withShowDatas(datas);
    [dialog setDidSelectedItems:^(AlertSingleChoiceDialog *dialog, NSArray *items) {
        kStrongSelf
        NSString *value = [items componentsJoinedByString:@","];
        strongSelf.holdModel.valueScheme.value = value;
        if (strongSelf.reloadOperation) {
            strongSelf.reloadOperation(1, strongSelf);
        }
    }];
    [self.qmui_viewController presentViewController:dialog animated:NO completion:nil];
    
//
//
//    //加载NSAttributedString
//    NSMutableArray *datas = [NSMutableArray array];
//    for (id obj in self.holdModel.valueScheme.enums) {
//        if ([obj isKindOfClass:NSString.class]) {
//            [datas qnm_addObj:[[NSAttributedString alloc] initWithString:safeString(obj) attributes:@{
//                NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
//                NSForegroundColorAttributeName:[UIColor systemBlueColor]
//            }]];
//        }
//        else if ([obj isKindOfClass:NSDictionary.class]) {
//            [datas qnm_addObj:[[NSAttributedString alloc] initWithString:safeString(obj[@"title"]) attributes:@{
//                NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
//                NSForegroundColorAttributeName:[UIColor systemBlueColor]
//            }]];
//        }
//    }
//
//    NSAttributedString *selectedItem = [[NSAttributedString alloc] initWithString:safeString(self.holdModel.valueScheme.value) attributes:@{
//        NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
//        NSForegroundColorAttributeName:[UIColor systemBlueColor]
//    }];
//
//    AlertSingleChoiceDialog *dialog = AlertSingleChoiceDialog.build;
//    dialog.withInfo(@"请选择").withSelectedItem(selectedItem).withShowDatas(datas);
//    [dialog setDidSelectedItems:^(AlertSingleChoiceDialog *dialog, NSArray *items) {
//        kStrongSelf
//        NSString *stringValue;
//        if ([items.firstObject isKindOfClass:NSString.class]) {
//            stringValue = items.firstObject;
//        } else if ([items.firstObject isKindOfClass:NSAttributedString.class]){
//            stringValue = [items.firstObject string];
//        }
//        strongSelf.holdModel.valueScheme.value = stringValue;
//        if (strongSelf.reloadOperation) {
//            strongSelf.reloadOperation(1, strongSelf);
//        }
//    }];
//    [self.qnm_viewController presentViewController:dialog animated:NO completion:nil];
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


