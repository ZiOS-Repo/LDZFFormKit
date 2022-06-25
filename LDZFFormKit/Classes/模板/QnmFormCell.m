//
//  QnmFormCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/23.
//

#import "QnmFormCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCategories/LDZFCategories.h>
#import "QnmFormUIMTemplateCell+ModelConfigure.h"
#import "QnmFormItemModel+GetData.h"
@interface QnmFormCell()
@property(nonatomic, strong) UIView *division;
@end

@implementation QnmFormCell

#pragma mark - init & dealloc
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _setupDefaultSubViews];
        [self _setupConstraints];
    }
    
    return self;
}

- (void)_setupDefaultSubViews {
    [self.contentView addSubview:self.division];
}

- (void)_setupConstraints {
    [self.division mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(PixelOne);
    }];
}


#pragma mark - configure
- (void)configureWithModel:(QnmFormItemModel *)model {
    [super configureWithModel:model];
    [self divisionInfoWithModel:model];
}

- (void)divisionInfoWithModel:(QnmFormItemModel *)model {
    self.division.backgroundColor = model.uiScheme.divisionIN.qnm_color;
    [self.division mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(model.uiScheme.divisionIN.qnm_insets.left);
        make.right.equalTo(self.contentView).offset(-model.uiScheme.divisionIN.qnm_insets.right);
        make.bottom.equalTo(self.contentView).offset(-model.uiScheme.divisionIN.qnm_insets.bottom);
        make.height.mas_equalTo(PixelOne);
    }];
}

#pragma mark - Useful Method
- (UIImage *)imageNamed:(NSString *)name {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
        stringByAppendingPathComponent:@"/LDZFFormKit.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}


#pragma mark - 懒加载
- (UIView *)division {
    if (_division == nil) {
        _division = [[UIView alloc] init];
    }
    return _division;
}
@end
