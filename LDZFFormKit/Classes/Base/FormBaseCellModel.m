//
//  FormBaseCellModel.m
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import "FormBaseCellModel.h"
#import "FormBaseCell.h"
#import "FormManager.h"
@implementation FormBaseCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.Identifier = [self defaultIdentifier];
        self.cellClass = [self defaultCellClass];
        
        self.cellWidth = SCREEN_WIDTH;
        //header
        self.headerHeight = FormManager.shared.headerHeight;
        self.headerColor = FormManager.shared.headerColor;
        //footer
        self.footerHeight = FormManager.shared.footerHeight;
        self.footerColor = FormManager.shared.footerColor;
        //body
        self.bodyHeight = FormManager.shared.bodyHeight;
        self.bodyColor = FormManager.shared.bodyColor;
        self.bodyPadding = FormManager.shared.bodyPadding;
        //separator
        self.separatorHeight = FormManager.shared.separatorHeight;
        self.separatorColor = FormManager.shared.separatorColor;
        self.separatorMargin = FormManager.shared.separatorMargin;
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
