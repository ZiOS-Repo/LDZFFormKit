//
//  FormBaseCellModel.h
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import <Foundation/Foundation.h>
#import <LDZFCommon/LDZFCommon.h>
#import <LDZFCategories/LDZFCategories.h>
#import "FormManager.h"
NS_ASSUME_NONNULL_BEGIN
@interface FormBaseCellModel : NSObject
#pragma mark - 重用
@property (nonatomic, strong) NSString *cellClass;
@property (nonatomic, strong) NSString *Identifier; //cell重用标识符
#pragma mark - header
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, strong) UIColor *headerColor;
#pragma mark - footer
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, strong) UIColor *footerColor;
#pragma mark - body
@property (nonatomic, assign) CGFloat bodyHeight;
@property (nonatomic, strong) UIColor *bodyColor;
@property (nonatomic, assign) UIEdgeInsets bodyPadding;
#pragma mark - separator
@property (nonatomic, assign) CGFloat separatorHeight;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, assign) UIEdgeInsets separatorMargin;
@property (nonatomic, assign) BOOL separatorHide;//default = NO
#pragma mark - frame
//cell 宽度 default is SCREEN_WIDTH
@property (nonatomic, assign) CGFloat cellWidth;
//cell 高度 default is 44.f
@property (nonatomic, assign) CGFloat cellHeight;

#pragma mark - data
//数据
@property (nonatomic, strong) id data;

#pragma mark - Useful Method
- (NSString *)defaultIdentifier;
- (NSString *)defaultCellClass;
- (void)updateBodyHeight;
@end

NS_ASSUME_NONNULL_END
