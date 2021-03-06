//
//  QnmFormCell.m
//  IQKeyboardManager
//
//  Created by zhuyuhui on 2022/6/23.
//

#import "QnmFormCell.h"
#import <Masonry/Masonry.h>
#import <LDZFCommon/LDZFCommon.h>
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
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.bottom.mas_offset(0);
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
        make.left.mas_offset(model.uiScheme.divisionIN.qnm_insets.left);
        make.right.mas_offset(-model.uiScheme.divisionIN.qnm_insets.right);
        make.bottom.mas_offset(-model.uiScheme.divisionIN.qnm_insets.bottom);
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


#pragma mark - ?????????
- (UIView *)division {
    if (_division == nil) {
        _division = [[UIView alloc] init];
    }
    return _division;
}
@end
