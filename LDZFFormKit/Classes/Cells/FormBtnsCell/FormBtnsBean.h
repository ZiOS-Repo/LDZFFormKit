//
//  FormBtnsBean.h
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormCommonBean.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormBtnsBean : FormCommonBean
//val
@property (nonatomic, strong) NSString *val;
@property (nonatomic, strong) UIFont *valFont;
@property (nonatomic, strong) NSArray *choices;
@property (nonatomic, strong) UIColor *btn_normal_color;
@property (nonatomic, strong) UIColor *btn_select_color;
@property (nonatomic, assign) CGSize  btn_size;
@property (nonatomic, assign) CGFloat btn_cornerRadius;
@property (nonatomic, assign) CGFloat btn_borderWidth;


@end

NS_ASSUME_NONNULL_END
