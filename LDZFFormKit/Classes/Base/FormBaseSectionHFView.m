//
//  FormBaseSectionHFView.m
//  CRJFormKit_Example
//
// on 2020/12/7.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "FormBaseSectionHFView.h"
#import "FormBaseSectionHFViewModel.h"

@interface FormBaseSectionHFView()
@property(nonatomic, strong) FormBaseSectionHFViewModel *hfInfo;
@end

@implementation FormBaseSectionHFView

- (void)buildSubview {
    [super buildSubview];
    [self.contentView addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable.superview).offset(18);
        make.right.equalTo(self.titleLable.superview).offset(-18);
        make.centerY.equalTo(self.titleLable.superview).offset(0);
    }];
}

- (void)loadContent {
    [super loadContent];
    self.hfInfo = self.data;
    self.contentView.backgroundColor = self.hfInfo.backgroundColor;

    if ([self.hfInfo.hfData isKindOfClass:NSString.class]) {
        self.titleLable.text = self.hfInfo.hfData;
    }
    
    [self.titleLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable.superview).offset(self.hfInfo.bodyPadding.left);
        make.right.equalTo(self.titleLable.superview).offset(-self.hfInfo.bodyPadding.right);
        make.centerY.equalTo(self.titleLable.superview).offset(0);
    }];
}

#pragma mark - 懒加载
- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.numberOfLines = 1;
        _titleLable.font = [UIFont systemFontOfSize:15];
    }
    return _titleLable;
}


@end
