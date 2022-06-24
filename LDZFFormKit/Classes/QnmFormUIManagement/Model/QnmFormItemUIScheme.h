//
//  QnmFormItemUIScheme.h
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/22.
//

#import <Foundation/Foundation.h>
#import <LDZFCommon/LDZFCommon.h>
#import <YYModel/YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface QnmFormTextUIScheme : NSObject
@property(nonatomic, copy) NSString *color;
@property(nonatomic, copy) NSString *font;
@property(nonatomic, copy) NSString *widthRatio;
- (UIColor *)qnm_color;
- (UIFont *)qnm_font;
- (CGFloat)qnm_widthRatio;
@end
@interface QnmFormTextfiledUIScheme : NSObject
@property(nonatomic, copy) NSString *color;
@property(nonatomic, copy) NSString *font;
@property(nonatomic, copy) NSString *placeholderFont;
@property(nonatomic, copy) NSString *placeholderTextColor;
@property(nonatomic, copy) NSString *keyboardType;
@property(nonatomic, copy) NSString *returnKeyType;
- (UIColor *)qnm_color;
- (UIFont *)qnm_font;
- (UIColor *)qnm_placeholderTextColor;
- (UIFont *)qnm_placeholderFont;
- (UIKeyboardType)qnm_keyboardType;
- (UIReturnKeyType)qnm_returnKeyType;
@end
@interface QnmFormTextViewUIScheme : NSObject
@property(nonatomic, copy) NSString *color;
@property(nonatomic, copy) NSString *font;
@property(nonatomic, copy) NSString *placeholderFont;
@property(nonatomic, copy) NSString *placeholderTextColor;
@property(nonatomic, copy) NSString *keyboardType;
@property(nonatomic, copy) NSString *returnKeyType;
- (UIColor *)qnm_color;
- (UIFont *)qnm_font;
- (UIColor *)qnm_placeholderTextColor;
- (UIFont *)qnm_placeholderFont;
- (UIKeyboardType)qnm_keyboardType;
- (UIReturnKeyType)qnm_returnKeyType;
@end
@interface QnmFormSwitchUIScheme : NSObject
@property(nonatomic, copy) NSString *onTintColor;
@property(nonatomic, copy) NSString *thumbTintColor;
@property(nonatomic, copy) NSString *onImage;
@property(nonatomic, copy) NSString *offImage;
- (UIColor *)qnm_onTintColor;
- (UIColor *)qnm_thumbTintColor;
@end
@interface QnmFormSliderUIScheme : NSObject
@property(nonatomic, copy) NSString *minimumTrackTintColor;//小于滑块当前值滑块条的颜色，默认为蓝色
@property(nonatomic, copy) NSString *maximumTrackTintColor;//大于滑块当前值滑块条的颜色，默认为白色
@property(nonatomic, copy) NSString *thumbTintColor;//当前滑块的颜色，默认为白色
- (UIColor *)qnm_minimumTrackTintColor;
- (UIColor *)qnm_maximumTrackTintColor;
- (UIColor *)qnm_thumbTintColor;
@end
@interface QnmFormDivisionUIScheme : NSObject
@property(nonatomic, copy) NSString *color;
@property(nonatomic, copy) NSString *invisible;
@property(nonatomic, copy) NSString *insets;
- (UIColor *)qnm_color;
- (BOOL)qnm_invisible;
- (UIEdgeInsets )qnm_insets;
@end
@interface QnmFormIconScheme : NSObject
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *size;
@end



@interface QnmFormItemUIScheme : NSObject
//模块通用颜色配置，可配置行模块背景色
//"#" + "FF(16进制透明度)" + "EEEEEE(16进制颜色)"
@property(nonatomic, copy) NSString *color;
//模块左边距
@property(nonatomic, copy) NSString *paddingLeft;
//模块右边距
@property(nonatomic, copy) NSString *paddingRight;
//是否可编辑
@property(nonatomic, copy) NSString *editable;

@property(nonatomic, strong) QnmFormTextUIScheme        *titleIN;
@property(nonatomic, strong) QnmFormTextUIScheme        *subtitleIN;
@property(nonatomic, strong) QnmFormTextUIScheme        *placeholderIN;
@property(nonatomic, strong) QnmFormTextfiledUIScheme   *textfiledIN;
@property(nonatomic, strong) QnmFormTextViewUIScheme    *textViewIN;
@property(nonatomic, strong) QnmFormSwitchUIScheme      *switchIN;
@property(nonatomic, strong) QnmFormSliderUIScheme      *sliderIN;
@property(nonatomic, strong) QnmFormDivisionUIScheme    *divisionIN;
@property(nonatomic, strong) QnmFormIconScheme          *iconIN;

#pragma mark - 取值
- (CGFloat)qnm_paddingLeft;
- (CGFloat)qnm_paddingRight;
- (UIColor *)qnm_color;
- (BOOL)qnm_editable;
- (QnmFormTextUIScheme *)qnm_titleIN;
- (QnmFormTextUIScheme *)qnm_subtitleIN;
- (QnmFormTextUIScheme *)qnm_placeholderIN;
- (QnmFormTextfiledUIScheme *)qnm_textfiledIN;
- (QnmFormTextViewUIScheme *)qnm_textViewIN;
- (QnmFormSwitchUIScheme *)qnm_switchIN;
- (QnmFormSliderUIScheme *)qnm_sliderIN;
- (QnmFormDivisionUIScheme *)qnm_divisionIN;
- (QnmFormIconScheme *)qnm_iconIN;
@end

NS_ASSUME_NONNULL_END

/*

 十六进制颜色透明度alpha值对照表
 100% — FF
 99% — FC
 98% — FA
 97% — F7
 96% — F5
 95% — F2
 94% — F0
 93% — ED
 92% — EB
 91% — E8
 90% — E6
 89% — E3
 88% — E0
 87% — DE
 86% — DB
 85% — D9
 84% — D6
 83% — D4
 82% — D1
 81% — CF
 80% — CC
 79% — C9
 78% — C7
 77% — C4
 76% — C2
 75% — BF
 74% — BD
 73% — BA
 72% — B8
 71% — B5
 70% — B3
 69% — B0
 68% — AD
 67% — AB
 66% — A8
 65% — A6
 64% — A3
 63% — A1
 62% — 9E
 61% — 9C
 60% — 99
 59% — 96
 58% — 94
 57% — 91
 56% — 8F
 55% — 8C
 54% — 8A
 53% — 87
 52% — 85
 51% — 82
 50% — 80
 49% — 7D
 48% — 7A
 47% — 78
 46% — 75
 45% — 73
 44% — 70
 43% — 6E
 42% — 6B
 41% — 69
 40% — 66
 39% — 63
 38% — 61
 37% — 5E
 36% — 5C
 35% — 59
 34% — 57
 33% — 54
 32% — 52
 31% — 4F
 30% — 4D
 29% — 4A
 28% — 47
 27% — 45
 26% — 42
 25% — 40
 24% — 3D
 23% — 3B
 22% — 38
 21% — 36
 20% — 33
 19% — 30
 18% — 2E
 17% — 2B
 16% — 29
 15% — 26
 14% — 24
 13% — 21
 12% — 1F
 11% — 1C
 10% — 1A
 9% — 17
 8% — 14
 7% — 12
 6% — 0F
 5% — 0D
 4% — 0A
 3% — 08
 2% — 05
 1% — 03
 0% — 00
 ————————————————
 版权声明：本文为CSDN博主「莫问前程F6」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
 原文链接：https://blog.csdn.net/qq_25506089/article/details/124835281
 
 */
