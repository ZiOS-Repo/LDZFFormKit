//
//  FormBaseCellModel.h
//  CRJFormKit
//
//  Created by zhuyuhui on 2020/11/29.
//

#import <Foundation/Foundation.h>
#import "FormConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface FormBaseCellModel : NSObject
@property (nonatomic, strong) NSString *cellClass;
@property (nonatomic, strong) NSString *Identifier; //cell重用标识符

@property (nonatomic, assign) CGFloat cellHeight;     //总高度
//header
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, strong) UIColor *headerColor;
//footer
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, strong) UIColor *footerColor;
//body
@property (nonatomic, assign) CGFloat bodyHeight;
@property (nonatomic, strong) UIColor *bodyColor;
@property (nonatomic, assign) UIEdgeInsets bodyPadding;
//separator
@property (nonatomic, assign) CGFloat separatorHeight;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, assign) UIEdgeInsets separatorMargin;
@property (nonatomic, assign) BOOL separatorHide;//default = NO

//数据
@property (nonatomic, strong) id data;

#pragma mark - Useful Method
- (NSString *)defaultIdentifier;
- (NSString *)defaultCellClass;
- (void)updateBodyHeight;
@end

NS_ASSUME_NONNULL_END
