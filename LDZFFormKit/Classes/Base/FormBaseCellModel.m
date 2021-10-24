//
//  FormBaseCellModel.m
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import "FormBaseCellModel.h"
#import "FormBaseCell.h"
#import "FormConfig.h"
@implementation FormBaseCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.Identifier = [self defaultIdentifier];
        self.cellClass = [self defaultCellClass];
        //header
        self.headerHeight = kFormConfig.headerHeight;
        self.headerColor = kFormConfig.headerColor;
        //footer
        self.footerHeight = kFormConfig.footerHeight;;
        self.footerColor = kFormConfig.footerColor;
        //body
        self.bodyHeight = kFormConfig.bodyHeight;
        self.bodyColor = kFormConfig.bodyColor;
        self.bodyPadding = kFormConfig.bodyPadding;
        //separator
        self.separatorHeight = kFormConfig.separatorHeight;
        self.separatorColor = kFormConfig.separatorColor;
        self.separatorMargin = kFormConfig.separatorMargin;
        self.separatorHide = NO;
    }
    return self;
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    _headerHeight = headerHeight;
    [self refreshCellHeight];
}

- (void)setBodyHeight:(CGFloat)bodyHeight {
    _bodyHeight = bodyHeight;
    [self refreshCellHeight];
}

- (void)setFooterHeight:(CGFloat)footerHeight {
    _footerHeight = footerHeight;
    [self refreshCellHeight];
}

- (void)refreshCellHeight {
    self.cellHeight = self.headerHeight + self.bodyHeight + self.footerHeight;
}

#pragma mark - Useful Method
- (NSString *)defaultIdentifier {
    return NSStringFromClass(FormBaseCell.class);
}
- (NSString *)defaultCellClass {
    return NSStringFromClass(FormBaseCell.class);
}
- (void)updateBodyHeight{}
@end
