//
//  FormConfig.h
//  CRJFormKit
//
// on 2020/11/29.
//  全局配置

#import <Foundation/Foundation.h>

#define kFormConfig [FormConfig sharedInstance]

NS_ASSUME_NONNULL_BEGIN

@interface FormConfig : NSObject
#pragma mark - CELL
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

//key
@property (nonatomic, strong) UIColor *keyColor;
@property (nonatomic, strong) UIFont *keyFont;
@property (nonatomic, assign) CGFloat keyMaxWidth;
//value
@property (nonatomic, strong) UIColor *valColor;
@property (nonatomic, strong) UIFont *valFont;
//placeholder
@property (nonatomic, strong) UIColor *placeholderColor;

//showDebugLine
@property (nonatomic, assign) BOOL showDebugLine;

+ (instancetype)sharedInstance;

@property (nonatomic, strong) UIWindow *window;

- (UIImage *)imageFromCustomBundle:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
