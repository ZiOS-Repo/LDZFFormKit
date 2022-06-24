//
//  QnmFormSubmitCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/24.
//

#import "QnmFormSubmitCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
@interface QnmFormSubmitCell()
@property(nonatomic, strong) UIButton *submitBtn;
@end

@implementation QnmFormSubmitCell

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
    [self.contentView addSubview:self.submitBtn];
}

- (void)setupConstraints {
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
}


#pragma mark - configure
- (void)configureWithModel:(QnmFormItemModel *)model {
    [super configureWithModel:model];
}

#pragma mark - event
- (void)clickSelff {
    if (self.customOperation) {
        self.customOperation(@{}, self);
    }
}



#pragma mark - 懒加载
- (UIButton *)submitBtn {
    if (_submitBtn == nil) {
        _submitBtn = [[UIButton alloc] init];
        _submitBtn.backgroundColor = [UIColor blueColor];
        _submitBtn.layer.cornerRadius = 22;
        _submitBtn.layer.masksToBounds = YES;
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(clickSelff)];
    }
    return _submitBtn;
}


@end

